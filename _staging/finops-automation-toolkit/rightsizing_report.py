#!/usr/bin/env python3
"""Create a read-only VM utilization candidate report from a CSV export."""

import argparse
import csv
import math
import sys
from collections import defaultdict


REQUIRED_COLUMNS = {"resource_id", "cpu_percent", "memory_percent"}


def percentile_95(values):
    ordered = sorted(values)
    return ordered[max(0, math.ceil(0.95 * len(ordered)) - 1)]


def read_samples(path):
    samples = defaultdict(lambda: {"cpu": [], "memory": []})
    with open(path, newline="", encoding="utf-8-sig") as source:
        reader = csv.DictReader(source)
        if reader.fieldnames is None or not REQUIRED_COLUMNS.issubset(reader.fieldnames):
            raise ValueError(
                "Input CSV must include columns: "
                + ", ".join(sorted(REQUIRED_COLUMNS))
            )

        for line_number, row in enumerate(reader, start=2):
            resource_id = (row["resource_id"] or "").strip()
            if not resource_id:
                raise ValueError(f"Line {line_number}: resource_id is empty")
            try:
                cpu = float(row["cpu_percent"])
                memory = float(row["memory_percent"])
            except (TypeError, ValueError) as error:
                raise ValueError(f"Line {line_number}: utilization must be numeric") from error
            if not (0 <= cpu <= 100 and 0 <= memory <= 100):
                raise ValueError(f"Line {line_number}: percentages must be between 0 and 100")
            samples[resource_id]["cpu"].append(cpu)
            samples[resource_id]["memory"].append(memory)

    if not samples:
        raise ValueError("Input CSV contains no utilization samples")
    return samples


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input_csv", help="CSV file with per-sample VM utilization")
    parser.add_argument("output_csv", help="Path for the candidate report")
    parser.add_argument("--cpu-p95-threshold", type=float, default=20.0)
    parser.add_argument("--memory-p95-threshold", type=float, default=30.0)
    args = parser.parse_args()

    if not (0 <= args.cpu_p95_threshold <= 100):
        parser.error("--cpu-p95-threshold must be between 0 and 100")
    if not (0 <= args.memory_p95_threshold <= 100):
        parser.error("--memory-p95-threshold must be between 0 and 100")

    try:
        samples = read_samples(args.input_csv)
        with open(args.output_csv, "w", newline="", encoding="utf-8") as destination:
            fields = [
                "resource_id",
                "sample_count",
                "cpu_p95_percent",
                "memory_p95_percent",
                "review_candidate",
                "note",
            ]
            writer = csv.DictWriter(destination, fieldnames=fields)
            writer.writeheader()
            for resource_id, readings in sorted(samples.items()):
                cpu_p95 = percentile_95(readings["cpu"])
                memory_p95 = percentile_95(readings["memory"])
                candidate = (
                    cpu_p95 < args.cpu_p95_threshold
                    and memory_p95 < args.memory_p95_threshold
                )
                writer.writerow(
                    {
                        "resource_id": resource_id,
                        "sample_count": len(readings["cpu"]),
                        "cpu_p95_percent": f"{cpu_p95:.2f}",
                        "memory_p95_percent": f"{memory_p95:.2f}",
                        "review_candidate": str(candidate).lower(),
                        "note": "Review with workload owner; not an automatic resize decision",
                    }
                )
    except (OSError, ValueError) as error:
        print(f"Error: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
