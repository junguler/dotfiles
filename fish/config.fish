set fish_greeting
#set TERM "xterm-256color"
set -gx PATH ~/bin/ $PATH

#set -g fish_ambiguous_width 1
#set -g fish_emoji_width 1
#set -g fish_width 1
# set -U fish_features qmark-noglob 

#set -l cyan (set_color cyan)
#set -l yellow (set_color yellow)
#set -l red (set_color red)
#set -l blue (set_color blue)
#set -l green (set_color green)
#set -l magenta (set_color magenta)
#set -l normal (set_color normal)
#set -l greyback (set_color -b "3c3c3c")
## https://fishshell.com/docs/current/cmds/set_color.html

bind \cP 'kill-word'
bind \co 'backward-kill-word'

export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --color=always"
export FZF_DEFAULT_OPTS="--ansi --height 100%"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d --hidden"

alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias notor='youtube-dl.exe --proxy ""'
alias gmic='/c/Games/gmic/gmic.exe'
alias mpv='mpv.exe'
alias mpvn='/c/Games/mpv.net/mpvnet.exe'
alias mpvre='mpv.exe --vf=sub,lavfi="negate"'
alias ari='aria2c'
alias pari='aria2c --http-proxy="http://127.0.0.1:9080"'
alias pcurl='curl -x socks5h://localhost:9050'
#alias python2='/usr/bin/python2.7.exe'
#alias python3='/usr/bin/python3.8.exe'
alias lolcat='/usr/bin/lolcat'
alias waifu='/c/games/waifu2x/waifu2x.exe'
alias proxy64='/c/Games/proxychains/x64/proxychains.exe -f "C:\Games\proxychains\proxychains.conf"'




function humanize_duration -d "Make a time interval human readable"
    if not string length --quiet $argv
         set --erase argv
         read --line argv
    end
    set hours (math --scale=0 $argv/\(3600 \*1000\))
    set mins (math --scale=0 $argv/\(60 \*1000\) % 60)
    set secs (math --scale=0 $argv/1000 % 60)
    if test $hours -gt 0
        set --append output $hours"h"
    end
    if test $mins -gt 0
        set --append output $mins"m"
    end
    if test $secs -gt 0
        set --append output $secs"s"
    end
    if not set --query output
        echo $argv"ms"
    else
        echo $output
    end
end

function fish_prompt
	set -l last_status $status
	if test $last_status = 0
		set_color -b "3c3c3c"
		set_color "f4c100" 
		echo -n " "
		set_color "efa500" 
		echo -n " "
		set_color normal
		set_color -b "3c3c3c" 
		echo -n (date +%I:%M:%S)
		set_color "5fbe47"
		echo -n " "
		set_color "008982" 
		echo -n " "
		set_color normal 
		set_color -b "3c3c3c"
		echo -n (prompt_pwd)
		set_color "00a8ec"
		echo -n " "
		set_color "0070b9"
		echo -n " "
		set_color normal
		set_color -b "3c3c3c"
		if test $CMD_DURATION
    		set -l human_command (echo $CMD_DURATION | humanize_duration) 	
 		echo -n $human_command
 		set_color -b "3c3c3c"
 		set_color "d583ae"
		echo -n " "
		set_color "db2b86"
		echo -n " "
		set_color normal
		set_color -b "3c3c3c"
		set_color normal
		echo -n " "
		end
	else
		set_color -b "3c3c3c"
		echo -n "  "
		echo -n (date +%I:%M:%S)
		echo -n "  "
		echo -n (prompt_pwd)
		echo -n "  "
		if test $CMD_DURATION
    		set -l human_command (echo $CMD_DURATION | humanize_duration) 	
 		echo -n $human_command
		echo -n "  "
		set_color normal
		echo -n " "
	end
 	end
end



# starship init fish | source




#function fish_prompt
#	set -l last_status $status
#	set_color -b "3c3c3c"
#	if test $last_status = 0
#    	echo -n "   "
#	else
#		echo -n "   "
#	end
#	set_color "f4c100" 
#	echo -n ""
#	set_color "efa500" 
#	echo -n " "
#	set_color normal
#	set_color -b "3c3c3c" 
#	echo -n (date +%I:%M:%S)" "
#	set_color "5fbe47"
#	echo -n ""
#	set_color "008982" 
#	echo -n " "
#	set_color normal 
#	set_color -b "3c3c3c"
#	echo -n (prompt_pwd)" "
#	set_color "00a8ec"
#	echo -n ""
#	set_color "0070b9"
#	echo -n " "
#	set_color normal
#	set_color -b "3c3c3c"
#    if test $CMD_DURATION
#    	set -l human_command (echo $CMD_DURATION | humanize_duration) 	
# 		echo -n $human_command
# 		echo -n " "
# 		set_color normal
# 		set_color -b "3c3c3c"
# 		set_color "d583ae"
#		echo -n ""
#		set_color "db2b86"
#		echo -n " "
#		set_color normal
# 		echo -n " "
# 	end
#end

# LOOP_CONSTRUCT; [COMMANDS...] break; [COMMANDS...] end

#function fish_prompt
#	set -l last_status $status
#	if test $last_status = 0
#		set_color -b "3c3c3c"
#		set_color "f4c100" 
#		echo -n " "
#		set_color "efa500" 
#		echo -n " "
#		set_color normal
#		set_color -b "3c3c3c" 
#		echo -n (date +%I:%M:%S)
#		set_color "5fbe47"
#		echo -n ""
#		set_color "008982" 
#		echo -n "  "
#		set_color normal 
#		set_color -b "3c3c3c"
#		echo -n (prompt_pwd)
#		set_color "00a8ec"
#		echo -n " "
#		set_color "0070b9"
#		echo -n " "
#		set_color normal
#		set_color -b "3c3c3c"
#		if test $CMD_DURATION
#    		set -l human_command (echo $CMD_DURATION | humanize_duration) 	
# 		echo -n $human_command
# 		set_color -b "3c3c3c"
# 		set_color "d583ae"
#		echo -n ""
#		set_color "db2b86"
#		echo -n "   "
#		set_color normal
#		set_color -b "3c3c3c"
#		set_color normal
#		echo -n " "
#		end
#	else
#		set_color -b "3c3c3c"
#		echo -n "  "
#		echo -n (date +%I:%M:%S)
#		echo -n "  "
#		echo -n (prompt_pwd)
#		echo -n "  "
#		if test $CMD_DURATION
#    		set -l human_command (echo $CMD_DURATION | humanize_duration) 	
# 		echo -n $human_command
#		echo -n "  "
#		set_color normal
#		echo -n " "
#	end
# 	end
#end
