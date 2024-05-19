# Cascading Mixed Method Replication

This setup consists of 1 primary, 1 secondary which replicates from primary using the old
binlog position-based method, and 1 more secondary which replicates from the other secondary
using the newer GTID-based method.

```mermaid
flowchart LR
  primary[(Primary)]
  secondary1[(Secondary 1)]
  secondary2[(Secondary 2)]
  primary-- binlog position-based -->secondary1
  secondary1-- GTID-based -->secondary2
```

## How to Configure

1. Scaffold the infrastructure
   ```bash
   docker compose up -d
   ```
2. Connect to `primary` at `root:root_password@localhost:3306/database1`
3. Get the binlog name and position by running:
   ```sql
   SHOW BINARY LOG STATUS;
   ```
4. Connect to `secondary1` at `root:root_password@localhost:3307/database1`
5. Connect to primary with the following command:
   ```sql
   CHANGE REPLICATION SOURCE TO
      ASSIGN_GTIDS_TO_ANONYMOUS_TRANSACTIONS = LOCAL,
      SOURCE_HOST = 'primary',
      SOURCE_USER = 'secondary1',
      SOURCE_PASSWORD = 'password',
      SOURCE_LOG_FILE = '<binlog name>',
      SOURCE_LOG_POS = <binlog position>;
   ```
6. Run:
   ```sql
   START REPLICA
   ```
7. Connect to `secondary2` at `root:root_password@localhost:3307/database1`

## Testing

Try running the following SQL script on `primary`:

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

In `secondary1` and `secondary2`'s `database1` database should appear a new table named `testing`
which has a single column named uid. If you inspect the data, there should be 3 entries
coming from the above SQL command.

Now try running the following SQL script on `secondary1`:

```sql
CREATE TABLE database1.users (
	uid INT NOT NULL,
	full_name TEXT NOT NULL
);

INSERT INTO database1.users
VALUES
	(1, 'Verstappen'),
	(2, 'Messi'),
	(3, 'Khalid');
```

Now in `secondary2`'s `database1` database should appear a new table named `users`
which contains 3 records coming from the above query. The same phenomena won't
occur on `primary`.
