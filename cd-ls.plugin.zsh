zstyle ':cd-ls:*' cd_ls_init_complete= false

# 'ls' after every 'cd'
if ! (( $chpwd_functions[(I)chpwd_cdls] )); then
  chpwd_functions+=(chpwd_cdls)
fi
function chpwd_cdls() {
  if if zstyle -T ':hist:*' load-hooks; then
    return
  fi
  if [[ -o interactive ]]; then
    emulate -L zsh
    eval ${CD_LS_COMMAND:-ls}
  fi
}
