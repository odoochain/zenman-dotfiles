local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- not sure what it does
-- maybe multiline cursor?

keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', ':w<CR>', {})

-- navigate splits
local opts = { noremap = true }

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)


--Disable arrow keys for vim hard mode

keymap("n", "Q" ,"<Nop>", opts)
keymap("n", "<Up>" ,"<Nop>",opts)
keymap("n", "<Down>", "<Nop>",opts)
keymap("n", "<Left>", "<Nop>",opts)
keymap("n", "<Right>", "<Nop>",opts)


-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- set x to not cut in registry/clipboard
keymap('n', 'x', '"_x', opts)


-- Delete a word backwards
-- keymap('n', 'dw', 'vb"_d', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {} )

-- New tab
keymap('n', 'te', ':tabedit', opts)
-- Split window
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Move window
-- keymap('n', '<Space>', '<C-w>w', opts)
-- keymap('', 'sh', '<C-w>h', opts)
-- keymap('', 'sk', '<C-w>k', opts)
-- keymap('', 'sj', '<C-w>j', opts)
-- keymap('', 'sl', '<C-w>l', opts)

-- Resize window
-- keymap('n', '<C-w><left>', '<C-w><', opts)
-- keymap('n', '<C-w><right>', '<C-w>>', opts)
-- keymap('n', '<C-w><up>', '<C-w>+', opts)
-- keymap('n', '<C-w><down>', '<C-w>-', opts)



-- map 0 to the first non-white space character
keymap('', '0', '^', opts)


vim.cmd[[
    let g:multi_cursor_use_default_mapping=0

    let g:multi_cursor_start_word_key      = '<C-s>'
    let g:multi_cursor_select_all_word_key = '<A-s>'
    let g:multi_cursor_start_key           = 'g<C-s>'
    let g:multi_cursor_select_all_key      = 'g<A-s>'
    let g:multi_cursor_next_key            = '<C-s>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'
]]


