hook global BufCreate '.*' %{
    echo -debug test 1111 %val{filename}
}
