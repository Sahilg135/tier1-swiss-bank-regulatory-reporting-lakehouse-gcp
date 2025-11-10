# Business context
Regulatory reporting requires accurate, timely submissions (T+1/T+0). This blueprint consolidates on‑prem sources into a governed bronze→silver→gold flow.

## Consumers & access patterns
- **Primary:** RegOps consumes **exported report packs** (XBRL/CSV + manifest + checksums).
- **Secondary:** Finance/Risk read‑only on **gold** marts.
- **No regulator access** to BigQuery.

**Legal responsibility during integration**
- Swiss legal entities retained statutory filing obligations until their merger dates.
- Engineering worked under the integration umbrella; deliverables were regulator‑ready packs for RegOps submission.
