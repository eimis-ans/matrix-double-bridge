# Synapse instance

## Configuration

`../setup-variable.sh` has been run

### Matrix configuration

Run this script to generate a signing key

```bash
./init.sh
```

## start

```bash
docker-compose up -d
```

### Create new matrix user

```bash
docker exec -it matrix_synapse_1 register_new_matrix_user -c /data/homeserver.yaml
```
