# Environment definitions for Nushell

# PATH definitions
$env.PATH ++= [
    /usr/local/bin
    ($env.HOME)/.nix-profile/bin
]

# FNM environment variables
fnm env --json | from json | load-env
$env.PATH = ($env.PATH | prepend ($env.FNM_MULTISHELL_PATH)/bin )
