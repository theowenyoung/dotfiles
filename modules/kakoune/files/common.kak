colorscheme gruvbox


# options
# Grep

when %sh{ [ -n "$(command -v rg)" ] && echo true || echo false } %{
    set-option global grepcmd 'rg -L --with-filename --column'
}

set-option global scrolloff 6,6


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

# Use main client as jumpclient
set-option global jumpclient main

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


# normal mapping
map global normal '#' :comment-line<ret>
map global normal <c-a-tab> ": buffer-next<ret>" -docstring 'next buffer'
map global normal <c-a-d> ": buffer *debug* <ret>" -docstring 'open buffer debug'


## user mode
map global user n -docstring 'next lint error' ':lint-next-error<ret>'
map global user f ':lsp-formatting' -docstring "lsp format"
map global user X ":evaluate-commands -buffer * %{ delete-buffer! }<ret>" -docstring "Close all buffers"
map global user b ': open-buffer-picker<ret>' -docstring 'buffer'
map global user j ': displayline_down<ret>' -docstring 'next display line'

## Goto mode



map global goto b ': open-file-picker<ret>' -docstring 'file'
# Goto mode mappings
map -docstring "next buffer" global normal <c-a-b> ': buffer-next<ret>'
# map -docstring "previous buffer" global normal 'c-a-s-tab' ': buffer-previous<ret>'
map -docstring "search tag in current file"     global goto '['     '<esc><c-s>: smart-select w; symbol<ret>'
map -docstring "search tag in global tags file" global goto ']'     '<esc><c-s>: smart-select w; ctags-search<ret>'



# Custom text objects
map global object w 'c\s,\s<ret>' -docstring "select between whitespace"


define-command -override open-file-picker -docstring 'open file picker' %{

  prompt file: -shell-script-candidates 'fd --type file' %{

    edit %val{text}

  }

}



map -docstring 'buffer' global goto b '<a-;>: open-buffer-picker<ret>'



# define-command -override open-buffer-picker -docstring 'open buffer picker' %{

#   prompt buffer: -buffer-completion %{

#     buffer %val{text}

#   }

# }



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
    printf "map global user -docstring 'yank to primary' y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection to %s primary}<ret>'\n" "$copy" "$backend"
    printf "map global user -docstring 'yank to clipboard' Y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection to %s clipboard}<ret>'\n" "$copy -selection clipboard" "$backend"
    printf "map global user -docstring 'replace from clipboard' R '|%s<ret>'\n" "$paste"
}





# Source a local project kak config if it exists
# Make sure it is set as a kak filetype
hook global BufCreate (.*/)?(\.kakrc\.local) %{
    set-option buffer filetype kak
}



def ide %{
    rename-client main
    set global jumpclient main

    new rename-client tools
    set global toolsclient tools

    new rename-client docs
    set global docsclient docs
}
