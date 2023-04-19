# -*- sh -*-

function kill_on_port() {
  local port=$1
  lsof -i:$port |  grep -v PID | awk '{print $2}' | xargs kill -9
}

function save_music_to_drive() {
  local f=$1
  cp $f  ~/Google\ Drive/My\ Drive/MyMusic/Jeff/
}

function loop_fs_usage() {
  while [[ 1 ]]; do 
    echo
    date
    sudo fs_usage -w -t 1 | awk '{print $NF}' | sort | uniq -c | sort -n
    sleep 1
  done
}

function git-commit-push() {
  local msg="$@"
  git add-commit -m "$msg" && git push
}

function git-nudge() {
  git-commit-push "nudge"
}
