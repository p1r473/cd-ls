zstyle ':cd-ls:*' init_complete false

# 'ls' after every 'cd'
if ! (( $chpwd_functions[(I)chpwd_cdls] )); then
  chpwd_functions+=(chpwd_cdls)
fi
function chpwd_cdls() {
  if ! zstyle -T ':cd-ls:*' init_complete; then
    return
  fi
  if [[ -o interactive ]]; then
    emulate -L zsh
    eval ${CD_LS_COMMAND:-ls}
  fi
}
