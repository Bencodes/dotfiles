-- Select the previous selection after indentation
vim.cmd 'vnoremap < <gv'
vim.cmd 'vnoremap > >gv'

-- Ctrl+p to fuzzy find files
vim.cmd 'nmap <C-p> :Telescope find_files<cr>'

-- Ctrl+o to launch nerd tree file browser
vim.cmd 'nmap <C-o> :NERDTreeToggle<cr>'