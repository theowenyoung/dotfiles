hook global WinDisplay '.*' %{
    evaluate-commands  %sh{
        if [[ -f "$kak_bufname" ]]
        then
          broot --send $(get-kak-session-name) -c ":focus $PWD/$kak_bufname"
        fi

    }
}
