# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/junguler/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#ohmyfish plugins

PROMPT='$(if [[ $? == 0 ]]; then echo "%F{226}%K{237} %F{214}%f %D{%I:%M:%S} %F{154}%F{34}%f $(shrink_path -f) %F{45}%F{33}%f 0ms %F{177}%F{127} %f%k"; else echo "  %D{%H:%M:%S}  $(shrink_path -f)  "; fi) '

# function for showing elapsed time in PROMPT
function preexec() {
  timer=$(date +%s%3N)
}

function precmd() {
  if [ $timer ]; then
    local now=$(date +%s%3N)
    local d_ms=$(($now-$timer))
    local d_s=$((d_ms / 1000))
    local ms=$((d_ms % 1000))
    local s=$((d_s % 60))
    local m=$(((d_s / 60) % 60))
    local h=$((d_s / 3600))
    if ((h > 0)); then elapsed=${h}h${m}m
    elif ((m > 0)); then elapsed=${m}m${s}s
    elif ((s >= 10)); then elapsed=${s}.$((ms / 100))s
    elif ((s > 0)); then elapsed=${s}.$((ms / 10))s
    else elapsed=${ms}ms
    fi

	PROMPT='$(if [[ $? == 0 ]]; then echo "%F{226}%K{237} %F{214}%f %D{%I:%M:%S} %F{154}%F{34}%f $(shrink_path -f) %F{45}%F{33} %f${elapsed} %F{177}%F{127} %f%k "; else echo "  %D{%H:%M:%S}  $(shrink_path -f)  ${elapsed}   "; fi)'
    unset timer
  fi
}


# my aliases
alias ls='ls -a --color=auto'
alias notor='youtube-dl --proxy ""'
alias ari='aria2c'
alias pari='aria2c --http-proxy="http://127.0.0.1:9080"'
alias pcurl='curl -x socks5h://localhost:9050'
alias twitch='mpv --ytdl=yes --ytdl-format=360p'

#my functions
primit () { for i in *.jpg; do echo $i; primitive -i $i -o p-$i."$1" -n "$2" -m "$3"; done; }
# 0=combo , 1=triangle , 2=rect , 3=ellipse , 4=circle , 5=rotatedrect , 6=beziers , 7=rotatedellipse , 8=polygon
# primitive -i input.png -o output.png -n 100 -m 1
# -s outputsize
gmic+ () { for i in *.jpg; do echo $i; gmic $i "$@" -o g-$i; done; }
ffseq () { ffmpeg -y -i "$@" -c:v mjpeg -q:v 2 -pix_fmt yuvj444p -sn -an -threads 0 image-%06d.jpg; }
ffvid () { cat *.jpg | ffmpeg -framerate "$1" -f image2pipe -i - -codec copy "$2"; }
ffvil () { cat *.jpg | ffmpeg -framerate "$1" -f image2pipe -i - "$2"; }
ffpri () { cat p-*.jpg | ffmpeg -framerate "$1" -f image2pipe -i - "$2"; }
ffgmi () { cat g-*.jpg | ffmpeg -framerate "$1" -f image2pipe -i - "$2"; }
audi () { youtube-dl "$@" -f 140; while [ $? -ne 0 ]; do torip ; youtube-dl "$@" -f 140; done; }
vide () { youtube-dl "$@" -f 18; while [ $? -ne 0 ]; do torip ; youtube-dl "$@" -f 18; done; }
vihd () { youtube-dl "$@" -f bestvideo[ext=mp4]+140; while [ $? -ne 0 ]; do torip ; youtube-dl "$@" -f bestvideo[ext=mp4]+140; done; }
mama () { youtube-dl "$@" -f 160+140 -k; while [ $? -ne 0 ]; do torip ; youtube-dl "$@" -f 160+140 -k; done; }
stream () { streamlink --player-passthrough hls "$@";}
streamp () { streamlink --https-proxy "socks5h://127.0.0.1:9050" "$@"; while [ $? -ne 0 ] ; do torip ; streamlink --https-proxy "socks5h://127.0.0.1:9050" "$@"; done ;}
streamr () { streamlink -o "output.ts" --https-proxy "socks5h://127.0.0.1:9050" "$@"; while [ $? -ne 0 ] ; do torip ; streamlink -o "output.ts" --https-proxy "socks5h://127.0.0.1:9050" "$@"; done ;}
streamr2 () { streamlink --https-proxy "socks5h://127.0.0.1:9050" -O "$0" | tee recording.ts | mpv - ;}
vimpv () { http_proxy=http://127.0.0.1:9080 mpv --ytdl=yes --ytdl-format=18 "$@"; while [ $? -ne 0 ] ; do torip ; http_proxy=http://127.0.0.1:9080 mpv --ytdl=yes --ytdl-format=18 "$@"; done ;}
aumpv () { http_proxy=http://127.0.0.1:9080 mpv --no-video --autofit-larger=358x202 "$@"; while [ $? -ne 0 ] ; do torip ; http_proxy=http://127.0.0.1:9080 mpv --no-video --autofit-larger=358x202 "$@"; done ;}
fflis () { for f in ./*."$1"; do echo "file '$f'" >> mylist.txt; done; }
ffmer () { ffmpeg -f concat -safe 0 -i mylist.txt -c copy output."$1"; rm mylist.txt; }
#pcurl () { curl -x socks5h://localhost:9050 "$@" ; while [ $? -ne 0 ] ; do torip ; curl -x socks5h://localhost:9050 "$@" ; done ;}
toon () { curl \
	-F 'image=@'$@''\
	-H 'api-key:83046935-b6e8-4a27-94fe-f639162ea4df'\
	https://api.deepai.org/api/toonify ; }
# api-key:quickstart-QUdJIGlzIGNvbWluZy4uLi4K'
toow () { curl \
	-F 'image='$@''\
	-H 'api-key:83046935-b6e8-4a27-94fe-f639162ea4df'\
	https://api.deepai.org/api/toonify ; }


# %F{11}%F{3}%F{10}%F{2}%F{14}%F{6}%F{12}%F{4}%F{13}%F{5}%F{9}%F{1}

plugins=(
	zsh-autosuggestions
	fast-syntax-highlighting
	zsh-completions
	shrink-path
	z
)

# load autocompletions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# disable window switching and other annoyences when using tab complete
setopt NO_BEEP AUTO_LIST HIST_IGNORE_ALL_DUPS globdots #MENU_COMPLETE

#source ~/.bashrc
bindkey -e
# control+u to remove the whole line behind cursor
bindkey \^U backward-kill-line
# control+o to remove a word before behind cursor
bindkey \^O backward-kill-word
# control+p to remove a word after behind cursor
bindkey \^P kill-word

source ~/.oh-my-zsh/custom/plugins/completion.zsh
source ~/.oh-my-zsh/custom/plugins/key-bindings.zsh

export FZF_DEFAULT_COMMAND="fdfind --type file --follow --hidden --color=always"
export FZF_DEFAULT_OPTS="--ansi --height 100%"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fdfind -t d --hidden"

# remove underline on web links
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

export PATH=~/bin:$PATH

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
