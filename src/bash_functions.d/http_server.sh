#!/bin/sh

print_details() {
  local port=$1

  local local_ip=$(ipconfig getifaddr en0)
  local local_hostname=$(hostname | tr '[:upper:]' '[:lower:]')

  local with_port=$port
  if [ $with_port -eq 80 ]; then
    with_port=""
  else
    with_port=":$with_port"
  fi
  local local_ip_host_port="http://$local_ip$with_port"
  local local_hostname_host_port="http://$local_hostname$with_port"

  echo
  echo "Serving at":
  if [[ ! -z "$local_ip_host_port" ]]; then
    echo "  $local_ip_host_port"
  fi
  if [[ ! -z "$local_hostname_host_port" ]]; then
    echo "  $local_hostname_host_port"
  fi
  echo

  echo $local_ip_host_port | pbcopy
  echo "$local_ip_host_port copied to clipboard"
  echo
}

python_command() {
  # echo python3 if it's found
  if command -v python &> /dev/null
  then
    echo "python"
    return
  fi
  if command -v python3 &> /dev/null
  then
    echo "python3"
    return
  fi
}

python=$(python_command)
if [ -z "$python" ]; then
  echo "No python found"
  exit 1
fi
port=${1:-8000}
print_details $port
$python -m http.server $port