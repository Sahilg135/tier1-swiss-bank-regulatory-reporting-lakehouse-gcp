# Exports & RegOps hand‑off (docs-only)
No direct regulator access to BigQuery. Export **XBRL/CSV** with **manifest** + **checksums** for **RegOps** to submit via portals.

## Deliverable structure (example)
```
gs://t1s-reg-reports/exports/YYYY-MM-DD/
  COREP_C34_creditrisk_consolidated.xbrl
  FINREP_F01_balance_sheet.xbrl
  LCR_summary.csv
  reconciliation_gl_vs_mart.csv
  manifest_YYYY-MM-DD.json
  checksums.sha256
```
