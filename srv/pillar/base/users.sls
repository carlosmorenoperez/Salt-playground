users:
  carlos:
    fullname: Carlos Moreno Perez
    password: $6$85R7EtUXdvo0eYK/$P99nt0I2kBehMgL9BtDH46yBTQtHY2HzUIzrLmiXmPmUcKBYNYine9Ern8uoIy/zHguqOgujTyzOxHOrd5rXu0
    enforce_password: true
    hash_password: true
    home: /home/carlos
    homedir_owner: carlos
    homedir_group: carlos
    user_dir_mode: 750
    createhome: true
    sudouser: true
    sudo_rules:
      - ALL=(ALL) ALL
#    ssh_key_type: rsa
#    ssh_keys:
#    ssh_auth:
#      - PUBLICKEY
#    pubkey: salt://keys/id_rsa
    ssh_config:
      all:
        hostname: "*"
        options:
          - "StrictHostKeyChecking no"
          - "UserKnownHostsFile=/dev/null"
    gitconfig:
      user.name: Carlos
      user.email: correo.carlosmoreno@gmail.com