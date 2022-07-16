vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = {
    [[ /██   /██                     /██    /██ /██ ]]              ,
    [[| ███ | ██                    | ██   | ██|__/]]              ,
    [[| ████| ██  /██████   /██████ | ██   | ██ /██ /██████/████]] ,
    [[| ██ ██ ██ /██__  ██ /██__  ██|  ██ / ██/| ██| ██_  ██_  ██]],
    [[| ██  ████| ████████| ██  \ ██ \  ██ ██/ | ██| ██ \ ██ \ ██]],
    [[| ██\  ███| ██_____/| ██  | ██  \  ███/  | ██| ██ | ██ | ██]],
    [[| ██ \  ██|  ███████|  ██████/   \  █/   | ██| ██ | ██ | ██]],
    [[|__/  \__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/]],
}
vim.g.dashboard_custom_footer = {[[ 9 什什]]}
vim.g.dashboard_custom_section = {
    libezw = {
        description = {" Work on libezw"},
        command = [[:e $SEM/miniproject/libezw | NvimTreeOpen]]
    },
    dotfiles = {
        description = {" Work on dotfiles"},
        command = [[:e ~/.local/share/chezmoi | NvimTreeOpen]]
    },
}
