# Regulatory Reporting Lakehouse — Tier-1 Swiss Bank (GCP)

> **Docs-only, sanitized case study.** No executable code. Names/data are illustrative; patterns are production-style and interview-ready.

![Docs](https://img.shields.io/badge/docs-complete-blue) ![License: MIT](https://img.shields.io/badge/License-MIT-lightgrey)

## Quick Facts

| Area | Choice |
|---|---|
| Cloud | Google Cloud Platform (GCP) |
| Core services (design target) | BigQuery, Cloud Storage, Pub/Sub, Dataflow/Dataproc, Cloud Composer, DLP, KMS, VPC‑SC |
| Workload types | T+1 batch reporting; near-real-time surveillance feeds |
| Data layers | **Bronze** (raw), **Silver** (validated), **Gold** (reg marts/views) |
| Controls | Contracts, DQ, lineage, SLOs, audit trail, PII minimization |
| Compliance mapping | **BCBS 239**, **MiFID II**, **EMIR**, **Basel III** *(illustrative)* |
| Export pattern | **XBRL/CSV + manifest + checksums** handed to **RegOps** |
| Safety | **Docs-only**. Folders `dbt/`, `composer/`, `sql/` are **placeholders** (no runnable artifacts). |

---

## Executive summary
- **Problem:** Legacy reg stacks were siloed and audit-weak.  
- **Solution:** GCP lakehouse blueprint with contracted ingestion, curated gold marts, DQ/lineage, and automated export packs.  
- **Impact (illustrative):** T+1 SLA met; fewer manual exceptions; lower BigQuery scan costs; zero‑touch pipeline replays.

### Program context & timeline
During the parent‑bank integration (2023–2025), statutory filings **remained the duty of the Swiss legal entities** until merger dates. The lakehouse was **designed/overseen under the integration umbrella**. For the Swiss legal entity, the **transformation ran mid‑2023 → mid‑2024**, with **migration and cut‑over in July 2024** ahead of broader rollout.

---

## Repository structure (docs-only)
- `assets/` — Mermaid architecture diagrams.
- `contracts/` — **specs** for datasets & governance (YAML).
- `docs/` — business context, controls, SLOs, lineage, exports, FAQ, runbooks.
  - `docs/patterns/` — **pseudocode** for orchestration, DQ, and gold marts (annotated examples).
- `ADRs/` — architectural decisions.
- `samples/` — tiny, obviously fake deliverable examples (manifest/checksums/CSV).  
- `dbt/`, `composer/`, `sql/` — **placeholders only** (README + .gitkeep).

> This repository intentionally **excludes runnable code**. See `docs/patterns/*` for non‑executable examples.

## Reuse this pattern
- Adapt **contracts** in `contracts/datasets/*.yml`.
- Implement orchestration per `docs/patterns/orchestration.md`.
- Model gold marts from `docs/patterns/gold_marts.md`.
- Export packs via `docs/exports.md` structure.

## License
MIT.
