local wezterm = require 'wezterm'

-- Function to get battery percentage
local function get_battery()
  local success, stdout = wezterm.run_child_process({
    "powershell", "-NoProfile", "-Command",
    "(Get-CimInstance Win32_Battery).EstimatedChargeRemaining"
  })

  if success and stdout ~= "" then
    local battery_level = tonumber(stdout:match("%d+"))
    return string.format("%d%%", battery_level)
  else
    return "Battery: N/A"
  end
end

-- Update right status bar with Battery and Time
wezterm.on("update-right-status", function(window, pane)
  local battery = get_battery()
  local time = wezterm.strftime("%H:%M:%S")

  -- Format the right status bar with spacing
  window:set_right_status(wezterm.format({
    { Text = string.format(" %s | %s ", battery, time) },
  }))
end)

-- Format tab titles with numbers
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return {
    { Text = string.format(" [%d] ", tab.tab_index + 1) }
  }
end)

return {
  -- default_prog = { "pwsh" },
    default_prog = { "pwsh", "-NoExit", "-Command", [[
    Write-Host "`n"
    Write-Host " /\_/\  " -ForegroundColor Yellow
    Write-Host "( o.o ) " -ForegroundColor Yellow
    Write-Host " > ^ <  " -ForegroundColor Yellow
    Write-Host "ranran" -ForegroundColor Yellow
  ]] },

  initial_rows = 30,
  initial_cols = 120,

  font = wezterm.font("MesloLGMDZ Nerd Font"),
  font_size = 13.0,
  
  enable_wayland = true,
  front_end = "OpenGL", 

  -- Hide the window title bar
  window_decorations = "RESIZE",
  window_background_opacity = 1.0, -- transparency

  -- Cursor customization
  cursor_blink_rate = 500,
  default_cursor_style = "BlinkingBlock",

  colors = {
    cursor_bg = "#FFFFFF",
    cursor_fg = "#000000",
    cursor_border = "#FFFFFF",

    tab_bar = {
      background = "#1E1E1E",

      active_tab = {
        bg_color = "#FFA500",
        fg_color = "#1E1E1E",
        intensity = "Bold",
      },

      inactive_tab = {
        bg_color = "#3A3A3A",
        fg_color = "#D4D4D4",
      },

      inactive_tab_hover = {
        bg_color = "#5A5A5A",
        fg_color = "#FFFFFF",
        italic = true,
      },

      new_tab = {
        bg_color = "#3A3A3A",
        fg_color = "#D4D4D4",
      },

      new_tab_hover = {
        bg_color = "#5A5A5A",
        fg_color = "#FFFFFF",
        italic = true,
      },
    },
  },
  
  -- Pane Styling 
  inactive_pane_hsb = {
    brightness = 0.5,
    saturation = 0.8,
  },

  -- Tab Bar Configuration
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,

  -- Remove the "X" close button from tabs
  show_tab_index_in_tab_bar = false,
  tab_max_width = 20,

  -- Remove the add button
  show_new_tab_button_in_tab_bar = false,

  -- Padding Customization 
  window_padding = {
    left = 10,
    right = 10,
    top = 5,
    bottom = 5,
  },

  -- Keybindings for switching tabs using Alt+Number
  keys = {
    { key = "1", mods = "ALT", action = wezterm.action.ActivateTab(0) },
    { key = "2", mods = "ALT", action = wezterm.action.ActivateTab(1) },
    { key = "3", mods = "ALT", action = wezterm.action.ActivateTab(2) },
    { key = "4", mods = "ALT", action = wezterm.action.ActivateTab(3) },
    { key = "5", mods = "ALT", action = wezterm.action.ActivateTab(4) },
    { key = "6", mods = "ALT", action = wezterm.action.ActivateTab(5) },
    { key = "7", mods = "ALT", action = wezterm.action.ActivateTab(6) },
    { key = "8", mods = "ALT", action = wezterm.action.ActivateTab(7) },
    { key = "9", mods = "ALT", action = wezterm.action.ActivateTab(8) },
  },
}

