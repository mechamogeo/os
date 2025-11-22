# Configuration for Nushell

$env.config = {
  show_banner: false

  footer_mode: auto
  use_ansi_coloring: true

  history: {
    max_size: 1_000_000
    file_format: sqlite
    isolation: true
  }
}

# Apply the plugins
const plugins_path = ($nu.config-path | path dirname | path join 'plugins')
source ($plugins_path | path join 'zoxide.nu')
