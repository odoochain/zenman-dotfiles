
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- >>> im-select
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- This is not necessary for linux distros
-- This make sure every time in normal mode, you only enter English letter
-- which will ensure your natural flow of work
vim.cmd
[[
let g:im_select_default = '1033'
]]

-- allow neovim to access system clipboard
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }




--TODO: currently in gui the size is somehow squashed, need a fix
-- Also, loading powershell is extremely slow, cmd is a much speedy option


-- vim.opt.shell='powershell.exe'


-- vim.opt.shell='pwsh.exe'
-- vim.opt.shellxquote=nil
-- vim.cmd
-- [[
-- let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
-- let &shellquote   = ''
-- let &shellpipe    = '| Out-File -Encoding UTF8 %s'
-- let &shellredir   = '| Out-File -Encoding UTF8 %s'
-- ]]
