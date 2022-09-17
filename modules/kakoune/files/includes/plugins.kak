evaluate-commands %sh{
    plugins="$kak_config/plugins"
    mkdir -p "$plugins"
    [ ! -e "$plugins/plug.kak" ] && \
        git clone -q https://github.com/andreyorst/plug.kak.git "$plugins/plug.kak"
    printf "%s\n" "source '$plugins/plug.kak/rc/plug.kak'"
}
plug "andreyorst/plug.kak" noload

plug "Delapouite/kakoune-mirror" %{
  map global normal "'" ': enter-user-mode mirror<ret>'
  map global normal "<a-'>" ': enter-user-mode -lock mirror<ret>'
}

plug "theowenyoung/kakoune-buffer-manager" config %{
    map global normal <c-a-b> ': buffer-manager<ret>'
}
plug "occivink/kakoune-find" config %{
    define-command -docstring "grep-apply-changes: apply changes specified in current *grep* buffer to their respective files" \
    grep-apply-changes %{ find-apply-changes -force }
}

plug "andreyorst/smarttab.kak" config %{
    hook global WinSetOption filetype=(makefile|gas) noexpandtab
} defer smarttab %{
    set-option global softtabstop 2
}

hook global BufCreate .* %{
  editorconfig-load
  autoconfigtab
}

# plug "alexherbo2/auto-pairs.kak" %{
#     enable-auto-pairs
# } config %{
#   set-option global auto_pairs ( ) { } [ ] '"' '"' "'" "'" ` ` “ ” ‘ ’ « » ‹ ›
# }


plug "kak-lsp/kak-lsp" config %{

    # uncomment to enable debugging
    # eval %sh{echo ${kak_opt_lsp_cmd} >> /tmp/kak-lsp.log}
    # set global lsp_cmd "kak-lsp -s %val{session} -vvv --log /tmp/kak-lsp.log"

    # this is not necessary; the `lsp-enable-window` will take care of it
    # eval %sh{${kak_opt_lsp_cmd} --kakoune -s $kak_session}


    set global lsp_diagnostic_line_error_sign '║'
    set global lsp_diagnostic_line_warning_sign '┊'

    define-command ne -docstring 'go to next error/warning from lsp' %{ lsp-find-error --include-warnings }
    define-command pe -docstring 'go to previous error/warning from lsp' %{ lsp-find-error --previous --include-warnings }
    define-command ee -docstring 'go to current error/warning from lsp' %{ lsp-find-error --include-warnings; lsp-find-error --previous --include-warnings }

    define-command lsp-restart -docstring 'restart lsp server' %{ lsp-stop; lsp-start }
    hook global WinSetOption filetype=(c|cpp|cc|rust|javascript|typescript) %{
        # set-option window lsp_auto_highlight_references true
        # set-option window lsp_hover_anchor false
        # lsp-auto-hover-enable
        # check is there is special kak-lsp config file, if so, use it
        eval %sh{

            if [ ! -z "$kak_opt_lsp_toml_path" ]; then
                # printf 'set global lsp_cmd "kak-lsp -vvv --log /tmp/kak-lsp2.log -s %s --config %s"\n' "$kak_session" "$kak_opt_lsp_toml_path"
                printf 'set global lsp_cmd "kak-lsp -s %s --config %s"\n' "$kak_session" "$kak_opt_lsp_toml_path"
                printf 'echo -debug kak_lsp will use %s as language config\n' "$kak_opt_lsp_toml_path"

            fi
        }

        echo -debug "Enabling LSP for filtetype %opt{filetype}"
        echo -debug "lsp start cmd: %opt{lsp_cmd}"
        lsp-enable-window
    }

    hook global WinSetOption filetype=(rust) %{
        set window lsp_server_configuration rust.clippy_preference="on"
    }

    hook global WinSetOption filetype=rust %{
        hook window BufWritePre .* %{
            evaluate-commands %sh{
                test -f rustfmt.toml && printf lsp-formatting-sync
            }
        }
    }

    hook global KakEnd .* lsp-exit
}

map global user l %{:enter-user-mode lsp<ret>} -docstring "LSP mode"
map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object e '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
map global object k '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
