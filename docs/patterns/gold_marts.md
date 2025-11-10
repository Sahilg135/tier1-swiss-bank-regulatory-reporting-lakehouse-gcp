# Gold marts pattern (annotated examples; docs-only)

**FINREP (F01 balance sheet) — illustrative view**
```sql
-- Not runnable; documentation only
SELECT DATE(event_ts) AS asof_date,
       SUM(quantity * price) AS balance_value_ccy
FROM stage.trades_dedup
GROUP BY 1;
```

**COREP (C34 credit risk) — illustrative aggregation**
```sql
-- Not runnable; documentation only
SELECT DATE(event_ts) AS asof_date,
       COUNT(*) AS exposure_count
FROM stage.trades_dedup
GROUP BY 1;
```

**Liquidity (LCR) — illustrative**
```sql
-- Not runnable; documentation only
SELECT DATE(event_ts) AS asof_date,
       135.2 AS lcr_ratio_demo
FROM stage.trades_dedup
GROUP BY 1;
```
