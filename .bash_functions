function kill_on_port() {
  local port=$1
  lsof -i:$port |  grep -v PID | awk '{print $2}' | xargs kill -9
}