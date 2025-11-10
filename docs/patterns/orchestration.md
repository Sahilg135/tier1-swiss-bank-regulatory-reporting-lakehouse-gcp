# Orchestration pattern (pseudocode)

```yaml
dag: reg_reporting_tplus1
schedule: "0 2 * * *"
tasks:
  - validate_bronze: "schema/contracts checks; watermark window"
  - stage_dedup: "write stage tables with deduplication"
  - dq_checks: "run expectations; block on failures"
  - build_reg_views: "refresh gold views/marts"
  - pack_exports: "prepare XBRL/CSV + manifest + checksums"
  - handoff_regops: "SFTP/secure-bucket drop + ticket"
  - archive: "move to retention path; attach evidence"
```
*This is documentation — not an Airflow DAG.*
