if status is-interactive
    # Commands to run in interactive sessions can go here

    fish_add_path ~/.local/bin

    abbr -a view 'vim -R'
    abbr -a batp 'bat -p'
    abbr -a i 'grep -i'
    abbr -a e 'grep -iv'

    zoxide init fish | source
    uv generate-shell-completion fish | source

end

# Fast react on wrong command
function fish_command_not_found
    echo "fish: Unknown command '$argv[1]'"
end
