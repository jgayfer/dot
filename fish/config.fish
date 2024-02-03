if status is-interactive

    # PATH
    fish_add_path $HOME/.cargo/bin
    fish_add_path /opt/homebrew/bin

    # Prompt
    starship init fish | source

    # Vi mode
    fish_vi_key_bindings
    set fish_vi_force_cursor 1
    set fish_cursor_insert line

    # Auto source ENV
    direnv hook fish | source

    set -gx EDITOR "hx"
end

