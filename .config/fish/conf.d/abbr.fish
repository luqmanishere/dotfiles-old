#!/usr/bin/env fish

# The file that stores all my abbreviations

# Git
abbr gs "git status"
abbr ga "git add"
abbr gc "git commit"
abbr gpull "git pull"
abbr gpush "git push"

# Pacman
abbr pacin "sudo pacman -S --needed"
abbr pacup "sudo pacman -Syu"
abbr pacse "pacman -Ss"
abbr pacinfo "pacman -Si"

# Aura
abbr aurin "sudo aura -Aax"
abbr aurup "sudo aura -Aaux"
abbr aurse "aura -As"
abbr aurinfo "aura -Ai"

# Systemctl
abbr sysrestart "sudo systemctl restart"
abbr sysstart "sudo systemctl start"
abbr sysstatus "sudo systemctl status"
abbr sysenable "sudo systemctl enable"

# systemctl user
abbr usysrestart "systemctl restart --user"
abbr usysstart "systemctl start --user"
abbr usysstatus "systemctl status --user"
abbr usysenable "systemctl enable --user"

# scrot
abbr sscrot 'scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png'

# Misc
abbr playlom "telnet playlom.com 4000"
