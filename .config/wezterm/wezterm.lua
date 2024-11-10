local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	color_scheme = "Tokyo Night Storm (Gogh)",
	--    font = wezterm.font 'Fira Code',
	font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true }),
	font_size = 12.0,
	default_prog = { "/bin/bash", "-l", "-c", "source ~/.bashrc && exec bash" },
}

return config
