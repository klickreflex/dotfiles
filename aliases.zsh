# Shortcuts
alias plz="php please"
alias g="git"
alias c="composer"
alias ci="composer install"
alias cr="composer require"
alias cl="clear"

# Common typos
alias nom="npm"

# Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Git
alias status="git status"
alias add="git add"
alias all="git add ."
alias push="git push"
alias pull="git pull"
alias prb="git pull --rebase"
alias commit="git commit -m"
alias check="git checkout"
alias branch="git branch"
alias reset="git reset"
alias clone="git clone"
alias init="git init && git add . && git commit -m 'Initial commit'"

# Other
# Get coding
alias start='git pull && php artisan cache:clear && code . && npm run hot'

# Unsets gf alias from ~/.oh-my-zsh/plugins/git/git.plugin.zsh to make gitfox binary work
unalias gf

# Time too first byte
alias ttfb="curl -o /dev/null -w 'Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total} \n'"

# Human friendly recursive file sizes
alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'
