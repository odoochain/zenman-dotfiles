-- plugin for quick surround feature
vim.cmd[[
    vmap Si S(i_<esc>f)
    au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>
]]

-- new-found features
-- press g then ctrl-g, shows the word count of current buffer
