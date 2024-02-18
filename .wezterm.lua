local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font_size = 16
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = 'Medium' })
config.enable_tab_bar = false
config.color_scheme = "Catppuccin Mocha"
config.default_prog = { "/usr/bin/tmux", "new-session", "-A", "-D", "-s", "main"}

return config
