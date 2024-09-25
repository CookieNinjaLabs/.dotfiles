# Flatpak
alias jasp='flatpak run org.jaspstats.JASP'
alias postman='flatpak run com.getpostman.Postman'
alias zotero='flatpak run org.zotero.Zotero'
alias discord='flatpak run com.discordapp.Discord'


# Editors
alias doom='emacs -nw' # Terminal Emacs
alias vi='nvim'
alias viConf='nvim ~/.config/nvim/init.lua'


# reload bash
alias bashAlias='nvim ~/.config/.bash_aliases'
alias bashConf='nvim ~/.bashrc'
alias bashSource='source ~/.bashrc'
alias bashSourceAlias='source ~/.config/.bash_aliases'
alias wezConf='nvim ~/.config/wezterm/wezterm.lua'


# Go
alias goTest="grc go test"
alias goTestV="grc go test -v"
alias goTestCov="grc go test -cover"
# alias goTest="go test -v"
alias goBench="go test -v -bench=."
alias goBenchMulti="go test -v -cpu -bench=."
alias goDocRun="godoc -http=:6060"

# shortcuts
alias py='python3'
