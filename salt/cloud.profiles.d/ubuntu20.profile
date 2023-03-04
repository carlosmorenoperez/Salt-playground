ubuntu20:
  provider: pve
  image: 1102
  location: pve
  agent_get_ip: True
  clone: true
  clone_from: 10
  clone_format: qcow2
  clone_full: 0
  name: ntp-server
  ssh_username:
  ssh_password:
  minion