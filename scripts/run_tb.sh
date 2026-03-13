#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <chip>"
    echo "Example: $0 sn7400"
    exit 2
fi

chip="$1"
outdir="build"
mkdir -p "$outdir"

verilator --binary --sv -Wall -Wno-fatal \
    "tb/${chip}_tb.sv" "rtl/${chip}.sv" \
    -o "${chip}_sim" \
    -Mdir "$outdir/${chip}"

"$outdir/${chip}/${chip}_sim"
