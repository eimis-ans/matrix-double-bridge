# Synapse instance

## Prerequisites

`../setup-variable.sh` has been run

### Matrix configuration

Run this script to generate a signing key

```bash
chmod +x init.sh
./init.sh
```

## start

```bash
docker-compose up -d
```

and wait a bit...

### Create new matrix user

```bash
docker exec -it matrix_synapse_1 register_new_matrix_user -c /mx-conf/homeserver.yaml
```

## Log in

You can go to your instance at <http://localhost:8083>
