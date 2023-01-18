local status_ok, dashboard  = pcall(require, "dashboard")
if not status_ok then
  return
end

if os.getenv('TERM') then
    dashboard.preview_command = 'cat | lolcat -F 0.3'
    dashboard.preview_file_path = '~/.config/nvim/static/neovim.cat'
end

dashboard.preview_file_height = 6
dashboard.preview_file_width = 54
dashboard.custom_center = {
    {icon = '  ',
    desc = 'Recently Latest Session                          ',
    shortcut = 'SPC s l',
    action ='SessionLoad'},
    {icon = '  ',
    desc = 'Recently Opened Files                            ',
    action =  'Telescope oldfiles',
    shortcut = 'SPC f h'},
    {icon = '  ',
    desc = 'Find File                                        ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'},
    {icon = '  ',
    desc ='File Browser                                         ',
    action =  'NERDTreeToggle',
    shortcut = 'C f'},
    {icon = '  ',
    desc = 'Find Word                                        ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f g'},
}
