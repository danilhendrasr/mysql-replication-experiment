# MySQL Replication Experiments

This repo contains a bunch of examples on how to set up a MySQL replication in different replication configurations. 
Each setup uses docker compose for easy scaffolding and testing.

## Table of Contents

- [x] [Simple binlog-based replication](./simple-binlog)
- [x] [Simple GTID-based replication](./simple-gtid)
- [x] [Cascading binlog-based replication](./cascading-binlog)
- [x] [Cascading GTID-based replication](./cascading-gtid)
- [x] [Cascading mixed replication](./cascading-mixed)
- [x] [Group replication](./group-replication)
- [ ] 🚧 InnoDB cluster

To play around with it yourself, go to the directory of the replication setup you want to test
and check out at the readme. There should be a guide on how to scaffold and test each setup.
