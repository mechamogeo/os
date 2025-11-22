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
