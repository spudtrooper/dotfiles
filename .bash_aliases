# -*- sh -*-

alias cd..='cd ..'
alias l='ls'
alias ll='ls -l'
alias la='ls -a'
alias m='more'
alias ips='nmap -sP 192.168.1.*'
alias gitpush='git push -u origin master'
alias formatjson='python -m json.tool'
alias http_server='python -m http.server'
alias goutil_install_local='pushd ~/Projects/goutil; ./scripts/install_local.sh; popd'
alias sublist3r='python /Users/jeff/Projects/Sublist3r/sublist3r.py'
alias sublister='python /Users/jeff/Projects/Sublist3r/sublist3r.py'
alias restart_mongodb='sudo brew services restart mongodb-community'
alias mynmap='nmap -A --osscan-guess -T4 -v -sV'
alias myarp-scan='arp-scan --localnet'

alias tf='terraform'
alias tfw='terraform workspace'
alias tfws='terraform workspace select'
alias tfs='terraform state'

alias tshark='/Applications/Wireshark.app/Contents/MacOS/tshark'
