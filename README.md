# MySQL Replication Experiments

This repo contains a bunch of configs to scaffold a MySQL replication setup from simple
binlog-based, simple GTID-based, to cascading binlog-based, and cascading GTID-based,
up to group replication.

## Roadmap

- [x] [Simple binlog-based replication](./simple-binlog)
- [x] [Simple GTID-based replication](./simple-gtid)
- [x] [Cascading binlog-based replication](./cascading-binlog)
- [x] [Cascading GTID-based replication](./cascading-gtid)
- [x] [Cascading mixed replication](./cascading-mixed)
- [ ] Group replication

> Note:
>
> If you want to try out the setup yourself, just go the corresponding directory and read the
> readme, I've put a guide on how to setup and test each setup.
