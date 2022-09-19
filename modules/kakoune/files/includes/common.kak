# options
colorscheme gruvbox
when %sh{ [ -n "$(command -v rg)" ] && echo true || echo false } %{
    set-option global grepcmd 'rg -L --with-filename --column'
}

declare-option str lsp_toml_path ''
declare-option str lf_id ''

# Use main client as jumpclient
set-option global jumpclient client0
# set statusbar on top
set-option global ui_options terminal_status_on_top=true
set-option global scrolloff 8,8
# insert mode
map global insert <c-a> "<esc>ghi" -docstring "go to line start"
map global insert <c-e> "<esc>gli" -docstring "go to line end"
map global insert <c-a-g> "<esc><space>ld" -docstring "go to defination"

# normal mapping
map global normal '#' :comment-line<ret>
map global normal <c-a-x> ": buffer *debug* <ret>" -docstring 'open buffer debug'
map global normal <c-a-d> ": delete-buffer! <ret>" -docstring 'delete buffer force'
map global normal <a-f> ": format<ret>" -docstring "format"
map global normal <c-a-n> ": tmux-repl-vertical -l 15 <ret>" -docstring "start a new repl pane"
map global normal <c-a-c> ': repl-send-text "exit<c-v><ret>" <ret>' -docstring 'close  new repl pane'
map global normal <c-a-g> "<esc><space>ld" -docstring "go to defination"
map global normal <c-a-t> ': repl-send-text %val{selection} <ret>' -docstring "eval selection from bash"
map global normal <c-n> ": edit -scratch<ret>" -docstring "new scratch"
map global normal <c-a-r> ': eval %val{selection} <ret>' -docstring "eval selection"
## user mode
map global user n -docstring 'next error' '<space>ln'
map global user h '<space>lh' -docstring "lsp help"
map global user f ':lsp-formatting' -docstring "lsp format"
map global user X ":evaluate-commands -buffer * %{ delete-buffer! }<ret>" -docstring "Close all buffers"
map global user j ': displayline_down<ret>' -docstring 'next display line'

## Goto mode
map global goto b '<a-;>: open-buffer-picker<ret>' -docstring 'open buffer picker'
map global goto f ': open-file-picker<ret>' -docstring 'file'
# Goto mode mappings
# map -docstring "previous buffer" global normal 'c-a-s-tab' ': buffer-previous<ret>'
map -docstring "search tag in current file"     global goto '['     '<esc><c-s>: smart-select w; symbol<ret>'
map -docstring "search tag in global tags file" global goto ']'     '<esc><c-s>: smart-select w; ctags-search<ret>'

# object mode
map global object 'l' '<esc>giGL' -docstring "select current line without"


# highlighter
hook global WinCreate .* %{ try %{
    add-highlighter buffer/numbers number-lines -relative -hlcursor -separator ' '
    add-highlighter buffer/matching show-matching
    add-highlighter buffer/wrap wrap -word -indent -marker '↪'
    add-highlighter buffer/show-whitespaces show-whitespaces -lf ' ' -spc ' ' -nbsp '⋅'
    add-highlighter global/ regex \b(TODO|FIXME|XXX|NOTE)\b 0:default+b
}}


hook global BufSetOption filetype=grep %{
    remove-highlighter buffer/wrap
}

# delete the *scratch* buffer as soon as another is created, but only if it's empty
hook global BufCreate '^\*scratch\*$' %{
    exec '%d'
    hook -once -always global BufCreate '^(?!\*scratch\*).*$' %{
        try %{
            # throw if the buffer has more than one character
            exec -buffer *scratch* 'L<a-K>..<ret>'
            db *scratch*
        }
    }
}



# hook ts, js format
hook global WinSetOption filetype=javascript %{
    set-option window formatcmd "deno fmt --ext js -"
    hook buffer BufWritePre .* %{format}
}
hook global WinSetOption filetype=typescript %{
    set-option window formatcmd "deno fmt --ext ts -"
    hook buffer BufWritePre .* %{format}
}



# Custom text objects
# map global object w 'c\s,\s<ret>' -docstring "select between whitespace"


define-command -override open-file-picker -docstring 'open file picker' %{

  prompt file: -shell-script-candidates 'fd --type file' %{

    edit %val{text}

  }

}







define-command -override open-buffer-picker -docstring 'open buffer picker' %{

  prompt buffer: -buffer-completion %{

    buffer %val{text}

  }

}



map -docstring 'grep' global goto / '<a-;>: open-grep-prompt<ret>'



define-command -override open-grep-prompt -docstring 'open grep prompt' %{
    # Provides word completion
    prompt grep: -shell-script-candidates %{
        echo "write '$kak_response_fifo'" > "$kak_command_fifo"
        cat "$kak_response_fifo" | kak -f 's[\w-]{4,}<ret>y%<a-R>a<ret>'
      } %{
        grep %val{text}
      }
}


## hook
# save on pressing enter
hook global NormalKey <ret> w

# Enable <tab>/<s-tab> for insert completion selection
# ──────────────────────────────────────────────────────

hook global InsertCompletionShow .* %{ map window insert <tab> <c-n>; map window insert <s-tab> <c-p> }
hook global InsertCompletionHide .* %{ unmap window insert <tab> <c-n>; unmap window insert <s-tab> <c-p> }







# system clipboard handling
evaluate-commands %sh{
    if [ -n "$SSH_TTY" ]; then
        copy='printf "\033]52;;%s\033\\" $(base64 | tr -d "\n") > /dev/tty'
        paste='printf "paste unsupported through ssh"'
        backend="OSC 52"
    else
        case $(uname) in
            Linux)
                if [ -n "$WAYLAND_DISPLAY" ]; then
                    copy="wl-copy -p"; paste="wl-paste -p"; backend=Wayland
                else
                    copy="xclip -i"; paste="xclip -o"; backend=X11
                fi
                ;;
            Darwin)  copy="pbcopy"; paste="pbpaste"; backend=OSX ;;
        esac
    fi
    printf "map global user -docstring 'paste (after) from clipboard' p '<a-!>%s<ret>'\n" "$paste"
    printf "map global user -docstring 'paste (before) from clipboard' P '!%s<ret>'\n" "$paste"
    printf "map global user -docstring 'yank to primary' y 'y<a-|>%s<ret>:echo -markup %%{{Information}copied selection to %s primary}<ret>'\n" "$copy" "$backend"
    printf "map global user -docstring 'yank to clipboard' Y 'y<a-|>%s<ret>:echo -markup %%{{Information}copied selection to %s clipboard}<ret>'\n" "$copy -selection clipboard" "$backend"
    printf "map global user -docstring 'replace from clipboard' R '|%s<ret>'\n" "$paste"
}





# Source a local project kak config if it exists
# Make sure it is set as a kak filetype
hook global BufCreate (.*/)?(\.kakrc\.local) %{
    set-option buffer filetype kak
}
hook global BufCreate (.*/)?(lfrc) %{
    set-option buffer filetype sh
}
