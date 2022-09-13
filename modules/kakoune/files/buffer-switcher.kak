#ga we assume that a buffer name will never contain newlines (not exactly true, but who cares)

face global BufferSwitcherCurrent black,green
declare-option -hidden str-list buffer_switcher_buflist
# declare-user-mode buffer-switcher-menu


define-command buffer-switcher %{
eval -save-regs '"/' %{
    reg / "^\Q%val{bufname}\E$"
    set-option global buffer_switcher_buflist
    evaluate-commands -no-hooks -buffer * %{
        evaluate-commands %sh{
            if [ "$kak_modified" = true ]; then
                printf "set-option -add global buffer_switcher_buflist \"+ $kak_bufname\""
            else
                printf "set-option -add global buffer_switcher_buflist \"  $kak_bufname\""
            fi
        }
    }
    # register dquote for paste later
    reg dquote %opt{buffer_switcher_buflist}
    # open scratch *buffer-switcher*
    edit -scratch *buffer-switcher*
    # delete all
    exec '%d'
    # paste list-str
    exec '<a-P>)'
    # get current selections, if selections greater than 1, then run <a-,>
    exec %sh{
        selections_arr=($kak_selections_length)
        if [ "${#selections_arr[@]}" -gt 1 ]; then
            printf "<a-,>i<ret><esc>"
        fi
    }
    # select by line
    exec '%<a-s>'
    try %{
        # remove *debug* buffer
        exec -draft '<a-k>^\*debug\*$<ret>d'
        # remove self
        exec -draft '<a-k>^\*buffer-switcher\*$<ret>d'
        # remove empty line, if any
        exec -draft "<a-k>^$<ret>d"
    }
    try %{
        # select current one
        exec '<a-k><ret>'
        # also highlight it in green
        addhl buffer/ regex "%reg{/}" 0:BufferSwitcherCurrent
    } catch %{
        exec gg
    }

    map -docstring "open buffer" buffer normal <ret> ': buffer-switcher-switch<ret>'
    map -docstring "delete current line or selection buffer" buffer normal <d> ': buffer-switcher-delete<ret>'
    map -docstring "force delete current line or selection buffer" buffer normal <D> ': buffer-switcher-delete-force<ret>'
    map -docstring "delete current line or selected buffer" buffer normal <a-d> ': buffer-switcher-delete<ret>:delete-buffer *buffer-switcher*<ret>'
    map -docstring "force delete current line or selected buffer" buffer normal <a-D> ': buffer-switcher-delete-force<ret>:delete-buffer *buffer-switcher*<ret>'
    map -docstring "back" buffer normal <q> ': delete-buffer *buffer-switcher*<ret>'
    map -docstring "delete all buffers" buffer normal <q> ': evaluate-commands -buffer * %{ delete-buffer }<ret>'
    map -docstring "force delete all buffers" buffer normal <Q> ': evaluate-commands -buffer * %{ delete-buffer! }<ret>'
    map -docstring "delete other buffers except current line or selections" buffer normal <e> ': echo yes<ret>'
    map -docstring "force delete other buffers except current line or selections" buffer normal <E> ': echo yes<ret>'
    map -docstring "show help info" buffer normal <?> ': buffer-switcher-help<ret>'

    # call help info first
    buffer-switcher-help
    hook global WinDisplay -once .* %{ try %{ delete-buffer *buffer-switcher* } }
}
}
define-command -hidden buffer-switcher-help %{
    info -title "Buffer Switcher Help" %{
        d: delete current line or selected buffers
        D: force delete current line or selected buffers
    }
}

define-command -hidden buffer-switcher-switch %{
    try buffer-switcher-select
    buffer %val{selection}
    try %{ delete-buffer *buffer-switcher* }
}

define-command -hidden buffer-switcher-select %{
    exec ',;xH<a-;>LL'
}
define-command -hidden buffer-switcher-delete %{
    buffer-switcher-select
    try %{ delete-buffer %val{selection} }
    exec 'xd'
    echo -markup "buffer %val{selection} deleted"
    buffer-switcher-close-list-when-empty
}
define-command -hidden buffer-switcher-delete-force %{
    exec ',;xH<a-;>LL'
    buffer-switcher-select
    try %{ delete-buffer! %val{selection} }
    exec 'xd'
    buffer-switcher-close-list-when-empty
}
define-command -hidden buffer-switcher-close-list-when-empty %{

    try %{
        exec -draft '/..<ret>'
    } catch %{
        try %{ delete-buffer *buffer-switcher* }
    }
}
