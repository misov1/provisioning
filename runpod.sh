#!/usr/bin/env bash
set -u

echo "[runpod.sh] patch start"

cat >/etc/portal.yaml <<'YAML'
applications:
  Instance Portal:
    hostname: localhost
    external_port: 1111
    internal_port: 11111
    open_path: /
    name: Instance Portal
  ComfyUI:
    hostname: localhost
    external_port: 8188
    internal_port: 18188
    open_path: /
    name: ComfyUI
  API Wrapper:
    hostname: localhost
    external_port: 8288
    internal_port: 18288
    open_path: /docs
    name: API Wrapper
  Jupyter:
    hostname: localhost
    external_port: 8080
    internal_port: 18080
    open_path: /
    name: Jupyter
  Syncthing:
    hostname: localhost
    external_port: 8384
    internal_port: 18384
    open_path: /
    name: Syncthing
YAML

cat >/etc/Caddyfile <<'CADDY'
:1111 { reverse_proxy 127.0.0.1:11111 }
:8188 { reverse_proxy 127.0.0.1:18188 }
:8288 { reverse_proxy 127.0.0.1:18288 }
:8080 { reverse_proxy 127.0.0.1:18080 }
:8384 { reverse_proxy 127.0.0.1:18384 }
CADDY

if [ -f /opt/supervisor-scripts/syncthing.sh ]; then
  sed -i 's/^GUI_ADDR=.*/GUI_ADDR="127.0.0.1:18384"/' /opt/supervisor-scripts/syncthing.sh
  grep -q '^GUI_LISTEN_ADDR=' /opt/supervisor-scripts/syncthing.sh || sed -i '/^GUI_ADDR=/a GUI_LISTEN_ADDR="0.0.0.0:18384"' /opt/supervisor-scripts/syncthing.sh
  sed -i 's/--gui-address="${GUI_ADDR}"/--gui-address="${GUI_LISTEN_ADDR}"/' /opt/supervisor-scripts/syncthing.sh
fi

supervisorctl restart caddy || true
supervisorctl restart instance_portal || true
supervisorctl restart comfyui || true
supervisorctl restart api-wrapper || true
supervisorctl restart jupyter || true
supervisorctl stop syncthing || true
pkill -f '/opt/syncthing/syncthing serve' || true
supervisorctl start syncthing || true

echo "[runpod.sh] patch done"
echo "[runpod.sh] default.sh start"

curl -fsSL https://raw.githubusercontent.com/misov1/provisioning/refs/heads/main/default.sh -o /tmp/default.sh
bash /tmp/default.sh

echo "[runpod.sh] default.sh done"
