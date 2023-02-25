# Salt-playground

My docker compose salt master api minion playground thing

## Pre-requisites

- Docker
- Docker-compose
- curl
## Set up the enviroment

* Clone repository and enter in the folder

```bash
https://github.com/carlosmorenoperez/Salt-playgound.git && cd Salt-playground
```

* Execute to bring up the containers

```bash
docker-compose up
```

## Testing

  * Conect to master container
  
   ```bash
   ./ClNa.sh
   ```
   * salt is in path so...
  
   ```bash
   root@master:/# salt -C '*' test.ping
   infra01:
     True
 
 
   -------------------------------------------
   Summary
   -------------------------------------------
   # of minions targeted: 1
   # of minions returned: 1
   # of minions that did not return: 0
   # of minions with errors: 0
   -------------------------------------------
   ```

  * Testing api

  ```bash
  ./test_api/test_ping.sh
  ```

  ```json
  return:
  - eauth: pam
  expire: 1677311180.5796027
  perms:
  - .*
  - '@jobs'
  - '@runner'
  - '@wheel'
  start: 1677267980.5796025
  token: 724361b55c77812174615d307bfa5f0f0ddcc4ba
  user: salt
  ```
  * Now we can test the api, copy the token to the script ```test_ping.sh```

  ```bash
  #!/bin/bash
  curl -sSk https://localhost:8000 \
    -H 'Accept: application/x-yaml' \
    -H 'X-Auth-Token: 724361b55c77812174615d307bfa5f0f0ddcc4ba'\
    -d client=local \
    -d tgt='*' \
    -d fun=test.ping
  ``` 

  * Run ```test_ping.sh```

  ```json 
  return:
  - infra01: true
  ```

  ## Cleaning Up

  * Be sure to erase the content of tls folder
  * docker system prune -a


  ## Salt Structure

  * Folder ```salt\master.d``` have the salt master configuratión split in files
  * Folder ```srv``` have the salt pillar structure 
  * Folder ```tls``` folder for storage the self-sing certifacate for the api

  ## Know error

  > No errors interrupt salt or salt-api functionality

  * I'm getting 2 errors for the master

  ```bash
  salt-master_1  | [ERROR   ] ReqServer clients tcp://0.0.0.0:4506
  salt-master_1  | [ERROR   ] ReqServer workers ipc:///var/run/salt/master/workers.ipc
  ```

  * And this error for the API

  ```bash  
  salt-master_1  | [ERROR   ] [24/Feb/2023:21:06:32] ENGINE Error in HTTPServer.serve
  salt-master_1  | Traceback (most recent call last):
  salt-master_1  |   File "cheroot/server.py", line 1810, in serve
  salt-master_1  |     self._connections.run(self.expiration_interval)
  salt-master_1  |   File "cheroot/connections.py", line 201, in run
  salt-master_1  |     self._run(expiration_interval)
  salt-master_1  |   File "cheroot/connections.py", line 218, in _run
  salt-master_1  |     new_conn = self._from_server_socket(self.server.socket)
  salt-master_1  |   File "cheroot/connections.py", line 272, in _from_server_socket
  salt-master_1  |     s, ssl_env = self.server.ssl_adapter.wrap(s)
  salt-master_1  |   File "cheroot/ssl/builtin.py", line 277, in wrap
  salt-master_1  |     s = self.context.wrap_socket(
  salt-master_1  |   File "ssl.py", line 501, in wrap_socket
  salt-master_1  |   File "ssl.py", line 1041, in _create
  salt-master_1  |   File "ssl.py", line 1310, in do_handshake
  salt-master_1  | ssl.SSLZeroReturnError: TLS/SSL connection has been closed (EOF) (_ssl.c:1129)
  ```

  
  


