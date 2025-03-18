local wezterm = require 'wezterm'

-- Function to get Wi-Fi name (truncated)
local function get_wifi_name()
  local success, stdout = wezterm.run_child_process({
    "powershell", "-NoProfile", "-Command",
    "(Get-NetConnectionProfile | Where-Object { $_.InterfaceAlias -like '*Wi-Fi*' }).Name"
  })

  if success and stdout ~= "" then
    local wifi = stdout:gsub("\n", ""):sub(1, 10) -- Trim and limit to 10 characters
    return wifi ~= "" and "" .. wifi or "" -- Hide if empty
  else
    return ""
  end
end

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

-- Update right status bar with Wi-Fi, Battery, and Time
wezterm.on("update-right-status", function(window, pane)
  local wifi_name = get_wifi_name()
  local battery = get_battery()
  local time = wezterm.strftime("%H:%M:%S")

  -- Format the right status bar with spacing
  window:set_right_status(wezterm.format({
    { Text = string.format(" %s | %s | %s ", wifi_name, battery, time) },
  }))
end)

-- Format tab titles with numbers
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return {
    { Text = string.format(" [%d] ", tab.tab_index + 1) } -- Numbers tabs from 1 onwards
  }
end)

return {
  -- default_prog = { "pwsh" },
    default_prog = { "pwsh", "-NoExit", "-Command", [[
    Write-Host "`n"
    Write-Host " /\_/\  " -ForegroundColor Yellow
    Write-Host "( o.o ) " -ForegroundColor Yellow
    Write-Host " > ^ <  " -ForegroundColor Yellow
    Write-Host "ranranxoxo" -ForegroundColor Yellow
  ]] },

  
  font = wezterm.font("MesloLGMDZ Nerd Font"),
  font_size = 12.0,
  
  enable_wayland = true,
  front_end = "OpenGL", 

  -- Hide the window title bar
  window_decorations = "RESIZE",
  window_background_opacity =1.0, -- transparency


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
}

