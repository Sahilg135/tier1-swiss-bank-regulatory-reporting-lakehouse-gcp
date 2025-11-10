# Migration plan (high level)
- Inventory sources → map to data contracts.
- Land CDC via connectors; batch reference via STS/SFTP → bronze.
- Validate in silver (schema/constraints/watermarks; DLQ for rejects).
- Curate BigQuery raw→stage→gold; add materialized views.
- Build regulator marts: reg_corep, reg_finrep, reg_liquidity.
- Export packs T+1; archive with retention + evidence.
