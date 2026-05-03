# Some experimenting; not used
function __term_caps
    # Returns: dumb | basic | color | unicode | fancy
    test -z "$TERM" -o "$TERM" = dumb; and echo dumb; and return

    set -l colors (tput colors 2>/dev/null); or set colors 0

    if test "$colors" -lt 8
        echo basic; return
    end

    # UTF-8 locale needed for any non-ASCII glyphs
    if not string match -qi '*utf*8*' -- "$LANG$LC_ALL$LC_CTYPE"
        echo color; return
    end

    # Truecolor + known nerd-font-friendly terminals ⇒ fancy
    if test "$COLORTERM" = truecolor -o "$COLORTERM" = 24bit
        if set -q KITTY_WINDOW_ID; or set -q WEZTERM_EXECUTABLE; \
           or contains -- "$TERM_PROGRAM" WezTerm ghostty iTerm.app vscode
            echo fancy; return
        end
    end

    echo unicode
end

switch (__term_caps)
    case fancy
        set -g prompt_arrow '❯ '
    case unicode
        set -g prompt_arrow '➜ '
    case '*'
        set -g prompt_arrow '> '
end

function fish_prompt
    set -l last_status $status
    set -l stat
    set -l pwd

    if test $last_status -ne 0
        set char (set_color red) $__prompt_arrow (set_color --reset)
    else
        set char $prompt_arrow
    end




    # Check if it's a transient or final prompt
    if contains -- --final-rendering $argv
        #set pwd (path basename $PWD)
    else
        set pwd (prompt_pwd)
    end

    string join '' -- (set_color green) $pwd (set_color --reset)
    echo  $char
end


if type -q starship
    # Let starship define its fish_prompt, then wrap it
    starship init fish | source


    # Save starship's version under a new name
    functions -c fish_prompt __starship_prompt
    functions -e fish_prompt

    function fish_prompt
        # Render starship's prompt (ends without a character)
        __starship_prompt

        # Append our vi-aware arrow
        set -l arrow $prompt_arrow
        set -l color
        switch $fish_bind_mode
            case default       # normal mode
                set color (set_color brblue)
                set arrow ': '   # or '▮ ', '« ', whatever you like
            case insert
                set color (set_color green)
            case replace replace_one
                set color (set_color yellow)
                set arrow 'r '
            case visual
                set color (set_color magenta)
                set arrow 'v '
            case '*'
                set color (set_color green)
        end



        printf '%s%s%s' $color $arrow (set_color normal)
    end

    function starship_transient_prompt_func
      starship module character
    end


end
