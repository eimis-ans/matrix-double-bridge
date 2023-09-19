# Synapse configuration
- Run this script to generate the synapse configuration files
    ```bash
    chmod +x init.sh
    ./init.sh
    ```

- Start Synapse and Element
    ```bash
    docker-compose up -d
    ```
    and wait until matrix container is healthy

- Create new matrix user
    ```bash
    docker exec -it matrix_matrix_1 register_new_matrix_user -u admin -a -c /mx-conf/homeserver.yaml
    ```
    And enter the password when asked by the prompt.


- Log in
You can go to your instance at <https://element.YOUR-DOMAIN> and login with the credentials you used at the previous step


- Create the bridge control room
Manually create a new unencrypted Matrix room to act as the administration control room. 
Note its internal room ID (Example: !abcdefg12345hijk:matrix.traefik.me).
Report it in the ../.env file in the SLACK_BRIDGE_ADMIN_ROOM variable.


-  Stop Synapse and Element
    ```bash
    docker-compose down
    ```
