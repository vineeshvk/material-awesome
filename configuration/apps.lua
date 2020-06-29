local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'xfce4-terminal',
    rofi = rofi_command,
    lock = 'i3lock',
    quake = 'xfce4-terminal',
    screenshot = '~/.config/awesome/configuration/utils/screenshot',
    cp_screenshot = '~/.config/awesome/configuration/utils/cp_screenshot',
    window_screenshot = '~/.config/awesome/configuration/utils/window_screenshot',
    -- region_screenshot = '~/.config/awesome/configuration/utils/screenshot -r',
    -- delayed_screenshot = 'sleep 10 ; ~/.config/awesome/configuration/utils/screenshot -r',

    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'google-chrome-stable',
    editor = 'code', -- gui text editor
    social = 'slack',
    game = rofi_command,
    files = 'thunar',
    music = rofi_command
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    'nm-applet --indicator', -- wifi
    'pa-applet', -- shows an audiocontrol applet in systray when installed.
    --'blueberry-tray', -- Bluetooth tray icon
    'xfce4-power-manager', -- Power manager
    'ibus-daemon --xim', -- Ibus daemon for keyboard
    'scream -u -p 4011 -i virbr1', -- scream audio sink
    'numlockx on',-- enable numlock
    '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --KDE '/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    -- MATE'/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
     'flameshot',
     'synology-drive -minimized',
     'steam -silent',
     'discord',
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    '~/.config/awesome/configuration/awspawn' -- Spawn "dirty" apps that can linger between sessions
  }
}
