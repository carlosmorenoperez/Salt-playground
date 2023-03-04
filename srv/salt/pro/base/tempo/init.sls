# Set up timezone
{% set timezone = salt['timezone.get_zone']  %}

zona_horaria:
 {{ timezone }}:
    timezone.system:
  - utc: false
{% endif %}

# Set up Chrony as ntp service for all the infraestrutre

# Installing 

chrony:
  pkg.installed:
    - name: chrony

# logic to set-up ntp server with pillar and rol

{% set ntp_servers = salt['pillar.get']('ntp:servers', []) %}
{% set ntp_master = salt['grains.filter_by']({'role': 'ntp_server'}) %}
{% set ntp_master_ip = [salt['grains.get'](minion, 'ipv4')[0] for minion in ntp_master] %}
{% set ntp_ip = ntp_master_ip[0] if foo_ips else None %}

chrony.conf:
  file.managed:
    - name: /etc/chrony.conf
    - source: salt://chrony/chrony.conf.j2
    - template: jinja
{% if grains['role'] == 'ntp_server' %}
    - context:
        ntp_servers: {{ ntp_servers|join(' ') }}
{% else %}
    - context:
        ntp_servers: {{ ntp_ip }}
{% endif %}

chrony-service:
  service.running:
    - name: chronyd
    - enable: True

