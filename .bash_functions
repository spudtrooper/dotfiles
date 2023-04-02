function kill_on_port() {
  local port=$1
  lsof -i:$port |  grep -v PID | awk '{print $2}' | xargs kill -9
}

function save_music_to_drive() {
  local f=$1
  cp $f  ~/Google\ Drive/My\ Drive/MyMusic/Jeff/
}