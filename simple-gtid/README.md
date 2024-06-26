# Simple GTID-based Replication

This setup only consists of 1 master and 1 slave with replication done using the
newer GTID mode.

```mermaid
flowchart LR
  master[(Master)]
  slave[(Slave)]
  master-->slave
```

## How to Configure

1. Scaffold the infrastructure
   ```bash
   docker compose up -d
   ```
2. Connect to `master` at `root:root_password@localhost:3306/database1`
3. Connect to `master` at `root:root_password@localhost:3307/database1`

## Testing

Try running the following SQL script on `master`:

```sql
CREATE TABLE database1.testing (
	uid INT NOT NULL
);

INSERT INTO database1.testing
VALUES
	(1),
	(2),
	(3);
```

In `slave` inside the `database1` database should appear a new table named `testing`
which has a single column named uid. If you inspect the data, there should be 3 entries
coming from the above SQL command.
