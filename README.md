# SN74xx_sv

Synthesizable SystemVerilog reimplementations of 7400-series logic ICs, with per-chip documentation, self-checking testbenches, and manifest-driven progress tracking.

## Scope

This repository models logical behavior of 7400-series devices for education and reusable RTL.
It intentionally abstracts analog and electrical nuances (timing bins, drive strength, package parasitics, etc.) unless explicitly documented for a chip.

## Repository Layout

- `rtl/`: synthesizable SystemVerilog implementations (one file per chip)
- `tb/`: self-checking testbenches (one file per chip)
- `docs/`: per-chip documentation
- `manifest/`: machine-readable and human-readable project tracking
- `scripts/`: verification helpers
- `shared/`: shared reusable utilities when justified
- `STATUS.md`: current project summary
- `CHIP_INDEX.md`: chip-by-chip status table

## Verification Flow

Primary simulation flow uses Verilator:

```sh
scripts/run_tb.sh sn7400
```

This compiles `tb/<chip>_tb.sv` with the corresponding `rtl/<chip>.sv`, runs the binary, and returns non-zero on failure.

## Coding Standards

- RTL must be synthesizable SystemVerilog.
- Per-chip workflow order: docs -> RTL -> testbench -> verification -> manifest updates.
- One logical chip per commit.
- Active-low signals should use `_n` suffix.
- Assumptions and abstractions must be documented per chip.

## Project Status

See `STATUS.md`, `CHIP_INDEX.md`, and `manifest/chips.yaml`.
