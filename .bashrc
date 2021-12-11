#Termux
if [ -n $TERMUX_VERSION ]; then
	export ROOT="/data/data/com.termux/files/usr"
fi

#PATH
export GOPATH="$HOME/go"
export GEM_HOME="$HOME/gems"
export PATH="$ROOT/lib/go/bin:$GOPATH/bin:$GEM_HOME/bin:$HOME/bin:$HOME/.composer/vendor/bin:$PATH"

#Alias
alias ls="ls --color='always' --group-directories-first -AgbGh"

#Var
export GOBIN="$HOME/go/bin"

#autorun
pastdayVar=211211
currentdayVar=`date +'%y%m%d'`
if [ $pastdayVar -ne $currentdayVar ]; then
	apt update
	sed -i -e "s/pastdayVar\=$pastdayVar/pastdayVar\=$currentdayVar/g" ~/.bashrc
fi

if [ -n $TERMUX_VERSION ]; then
	function Termuxwakelock() {
		if [[ ! `termux-notification-list` =~ 'wake lock held' ]]; then
			termux-wake-lock
		fi
	}
	Termuxwakelock >/dev/null 2>&1 &
fi
