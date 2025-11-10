# Data quality pattern (docs-only)
**Contracts** define schema/constraints. **Expectations** run post‑stage.

| Check | Target | Threshold |
|---|---|---|
| not_null(trade_id) | stage.trades_dedup | = 0 failures |
| price > 0 | stage.trades_dedup | = 0 failures |
| side in {BUY, SELL} | raw.trades | = 0 failures |

Example (annotated — not runnable):
```sql
-- Ensure positive price (illustrative)
SELECT COUNTIF(price <= 0) AS bad FROM stage.trades_dedup;
```
