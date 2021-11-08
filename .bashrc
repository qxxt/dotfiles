#PATH
export GEM_HOME="$HOME/gems"
export PATH="$GEM_HOME/bin:$HOME/bin:$HOME/.composer/vendor/bin:$PATH"

#VAR
github_token=$(cat $HOME/github_token)

#Alias
alias ls="ls --color='always' --group-directories-first -AgbGh"
