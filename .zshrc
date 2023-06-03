# BEGIN: This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
# END: This speeds up pasting w/ autosuggest


alias nx='npm run-script env --'

# Gives a short random string
random() { 
    openssl rand -base64 12
}

# Gives you the HTML equivalent of clipboard content
debugpaste() {
    osascript -e 'the clipboard as «class HTML»' | perl -ne 'print chr foreach unpack("C*",pack("H*",substr($_,11,-3)))'
}

# Disable saving host-key to local known_hosts. Useful if you frequently login to new hosts
sshaws () {
  ssh -o StrictHostKeyChecking=no ec2-user@$1
}
