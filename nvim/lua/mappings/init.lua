local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "gt", "<Cmd>tabNext<CR>", opts)
map("n", "gT", "<Cmd>tabprevious<CR>", opts)

--telescope
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fc", ":Telescope git_commits<CR>", opts)
map("n", "<leader>fB", ":Telescope git_branches<CR>", opts)
map("n", "<leader>fs", ":Telescope git_status<CR>", opts)
map("n", "<leader>fm", ":Telescope marks<CR>", opts) -- search marks
map("n", "<leader>fo", ":Telescope oldfiles<CR>", opts) -- search history
map("n", "<leader>fC", ":Telescope grep_string<CR>", opts) -- search under cursor
map("n", "<leader>fk", ":Telescope keymaps<CR>", opts) -- search key maps
map("n", "<leader>fM", ":Telescope commands<CR>", opts) -- search key maps
map("n", "<leader>ft", ":Telescope flutter commands<CR>", opts) -- search key maps

-- split
map("n", "<C-S-Left>", ":vertical resize +15<CR>", opts)
map("n", "<C-S-Right>", ":vertical resize -15<CR>", opts)
map("n", "<C-S-Down>", ":resize -3<CR>", opts)
map("n", "<C-S-UP>", ":resize +3<CR>", opts)

-- remap
-- map("i", "jj", "<Esc>", {})

--"split navigations
map("n", "<C-J>", "<C-W><C-J>", {})
map("n", "<C-L>", "<C-W><C-L>", {})
map("n", "<C-H>", "<C-W><C-H>", {})
map("n", "<C-K>", "<C-W><C-K>", {})

map("n", "<leader>z", "<c-w>_ | <c-w>|", {})
map("n", "<leader>o", "<c-w>=", {})

--navigation
map("i", "<C-h>", "<Left>", {})
map("i", "<C-k>", "<UP>", {})
map("i", "<C-l>", "<Right>", {})

-- line up or down
map("n", "<leader>s", ":m+<CR>", opts)
map("n", "<leader>w", ":m-2<CR>", opts)

map("n", "<leader><space>", ":noh<cr>:call clearmatches()<cr>", opts)
map("n", "<leader>r", ":luafile %<CR>", opts)
map("n", "<leader>ps", ":PackerSync<CR>", opts)
-- toggle term
--
map("n", "<leader>tt", ":ToggleTerm direction=float<CR>", opts)
map("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", opts)
map("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opts)
-- formatter
map("n", "<leader>pp", ":lua vim.lsp.buf.format()<CR>", opts)
map("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", opts)

-- buffer
map("n", "<leader>bd", ":bdelete<CR>", opts)
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)

-- vim git fugitive
-- map("n", "<leader>ga", ":Git add %<CR>", opts)
-- map("n", "<leader>gA", ":Git add .<CR>", opts)
-- map("n", "<leader>gr", ":Git restore --staged %<CR>", opts)
-- map("n", "<leader>gR", ":Git restore --staged %<CR>", opts)
-- map("n", "<leader>gc", ":Git commit <CR>", opts)
map("n", "<leader>gs", ":G <CR>", opts)
-- map("n", "<leader>gp", ":Git push <CR>", opts)
-- map("n", "<leader>gb", ":Git blame<CR>", opts)
-- map("n", "<leader>gl", ":Git log<CR>", opts)

-- Twilight
-- map("n", "<leader>tw", ":Twilight<CR>", opts)
