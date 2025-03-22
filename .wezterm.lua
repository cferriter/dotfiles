-- Pull in the WezTerm API.
local wezterm = require 'wezterm'

-- Create a convenient config variable.
local config = wezterm.config_builder()

config.font_size = 10
config.color_scheme = 'Tokyo Night Moon'
config.audible_bell = 'Disabled'
config.hide_tab_bar_if_only_one_tab = true
config.default_domain = 'WSL:Ubuntu'

-- Return the configuration to WezTerm.
return config
