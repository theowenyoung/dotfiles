remove-hooks global file-explore
hook -group file-explore global WinDisplay '.*' %{
    evaluate-commands  %sh{
        if [ -f "$kak_buffile" ] && [ ! -z "$kak_opt_lf_id" ]
        then
          # broot --send $(get-current-project-name) -c ":focus $PWD/$kak_bufname"
          # printf "0c%s" "$PWD/$kak_bufname" > "$NNN_PIPE"
          lf -remote "send $kak_opt_lf_id select \"$kak_buffile\""
        fi

    }
}
hook -group file-explore global ClientClose "\Qclient0\E" %{

    eval %sh{
        if [ ! -z "$kak_opt_lf_id" ]
        then
          # broot --send $(get-current-project-name) -c ":focus $PWD/$kak_bufname"
          # printf "0c%s" "$PWD/$kak_bufname" > "$NNN_PIPE"
          printf 'echo -debug exit lf client\n'
          lf -remote "send $kak_opt_lf_id quit"
          printf 'set-option global lf_id ""\n'

        fi

    }
}
