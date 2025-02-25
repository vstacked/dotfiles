-- Pull in the wezterm API
local wezterm = require("wezterm")

--**wezterm.on("gui-startup", function(cmd)
--**	---@diagnostic disable-next-line: unused-local
--**	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
--**	window:gui_window():toggle_fullscreen()
--**end)

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Poimandres"

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 10.25

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

local basename = function(s)
	local charRemoved = string.gsub(s, "[ ,;:/]*$", "") -- remove characters on the end of string
	-- Nothing a little regex can't fix
	-- return string.gsub(charRemoved, "(.*[/\\])(.*)", "%2") -- windows
	return string.gsub(charRemoved, "(.*[//])(.*)", "%2")
end

-- config.default_prog = { "zsh" }
-- { "C:/Program Files/WindowsApps/Microsoft.PowerShell_7.4.4.0_x64__8wekyb3d8bbwe/pwsh.exe -nologo" }
-- config.default_prog = { "C:/Windows/system32/bash.exe" }

config.window_frame = {
	inactive_titlebar_bg = "#0f1017",
	active_titlebar_bg = "#0f1017",
}

config.colors = {
	background = "#0f1017",
	tab_bar = {
		background = "#0f1017",
		active_tab = {
			bg_color = "#0f1017",
			fg_color = "#E4F0FB",
		},

		inactive_tab = {
			bg_color = "#14161e",
			fg_color = "#506477",
		},

		inactive_tab_hover = {
			bg_color = "#171922",
			fg_color = "#A6ACCD",
		},
		new_tab = {
			bg_color = "#14161e",
			fg_color = "#506477",
		},
		new_tab_hover = {
			bg_color = "#171922",
			fg_color = "#A6ACCD",
		},
	},
}

wezterm.on("update-status", function(window, pane)
	-- https://github.com/theopn/dotfiles/blob/main/wezterm/wezterm.lua

	-- Current working directory
	local cwd = pane:get_current_working_dir().path
	cwd = cwd and basename(cwd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M")

	local SOLID_LEFT_ARROW = ""
	local prefix = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#0f1017" } }

	-- https://github.com/dragonlobster/wezterm-config/blob/main/wezterm.lua
	if window:leader_is_active() then
		prefix = "  🪺  "
		---@diagnostic disable-next-line: undefined-global
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#14161e" } }
	end -- arrow color based on if tab is first pane

	-- Left status
	window:set_left_status(wezterm.format({
		{ Background = { Color = "#506477" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Foreground = { Color = "#767C9D" } },
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

wezterm.on("format-tab-title", function(tab)
	local cwd = tab.active_pane.current_working_dir.path
	cwd = cwd and basename(cwd) or ""

	if tab.is_active then
		return "  🐦‍⬛  "
	end

	return " [" .. tab.tab_index + 1 .. "] " .. cwd .. " "
end)

wezterm.on("format-window-title", function(tab, _, tabs)
	local cwd = tab.active_pane.current_working_dir.path
	cwd = cwd and basename(cwd) or ""

	local zoomed = ""
	if tab.active_pane.is_zoomed then
		zoomed = "[Z] "
	end

	local index = ""
	if #tabs > 1 then
		index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
	end

	return zoomed .. index .. cwd
end)

config.leader = { key = "w", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
		}),
	},

	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "q",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "LEADER",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "LEADER",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "LEADER",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "LEADER",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "LEADER",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "LEADER",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "LEADER",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
}

for i = 0, 8 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i + 1),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- and finally, return the configuration to wezterm
return config
