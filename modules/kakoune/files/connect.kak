hook global BufCreate '.*' %{
    evaluate-commands  %sh{
        broot --send $(get-kak-session-name) -c ":focus $PWD/$kak_bufname"

    }
}
