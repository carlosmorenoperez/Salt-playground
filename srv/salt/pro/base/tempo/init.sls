{% set timezone = salt['timezone.get_zone']  %}
{% if timezone != "Europe/Madrid" %}
zona_horaria:
 {{ timezone }}:
    timezone.system:
  - utc: false
{% endif %}

{% if grain.ntp_sever is defined %}
{% set ntp_servers = salt['pillar.get']('ntp:servers', []) %}
chrony:
  pkg.installed:
    - name: chrony

chrony.conf:
  file.managed:
    - name: /etc/chrony.conf
    - source: salt://chrony/chrony.conf.j2
    - template: jinja
    - context:
        ntp_servers: {{ ntp_servers|join(' ') }}

chrony-service:
  service.running:
    - name: chronyd
    - enable: True

{% endif %}