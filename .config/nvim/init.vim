call plug#begin('~/.vim/plugged')
  " Productivity
  Plug 'szw/vim-maximizer'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  " Plug 'akinsho/git-conflict.nvim'
  " Plug 'tpope/vim-repeat'
  " Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sleuth'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Plug 'abecodes/tabout.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'VonHeikemen/lsp-zero.nvim'
  Plug 'tpope/vim-surround'
  Plug 'qpkorr/vim-bufkill'
  Plug 'ggandor/lightspeed.nvim'
  Plug 'yuezk/vim-js'
  Plug 'wakatime/vim-wakatime'
  " Appearance
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'tiagovla/tokyodark.nvim'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'hoob3rt/lualine.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'xiyaowong/nvim-transparent'
  " Plug 'TimUntersberger/neogit'
  " Plug 'folke/zen-mode.nvim'
call plug#end()

" default options
set completeopt=menu,menuone,noselect " better autocomplete options
set splitright " splits to the right
set splitbelow " splits below
set expandtab " space characters instead of tab
set tabstop=2 " tab equals 2 spaces
set shiftwidth=2 " indentation
set number " Show current line absolute number
set relativenumber " show relative line numbers
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
" set diffopt+=vertical " starts diff mode in vertical split
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't create backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't need to press enter so often
set signcolumn=yes " add a column for sings (e.g. LSP, ...)
set updatetime=520 " time until update
set undofile " persists undo tree
set title " Show folder on bar
set mouse= " Disable mouse
set colorcolumn=80 " Color column number 80
let &titlestring = '%{%substitute(getcwd(), "^" . expand("$HOME") . "/repos/\\(.\\{-}\\)/.*", "\\=submatch(1)", "")%}'
set clipboard=unnamedplus " use system clipboard

filetype plugin indent on " enable detection, plugins and indents

if (has("termguicolors"))
  set termguicolors " better colors, but makes it very slow!
endif

let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
" let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown

" Remove trailing whitespaces
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Using file extension
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Often files are not necessarily identified by extension, if so use e.g.:
" autocmd BufWritePre * if &ft =~ 'sh\|perl\|python' | :call <SID>StripTrailingWhitespaces() | endif

" Or if you want it to be called when file-type i set
" autocmd FileType sh,perl,python  :call <SID>StripTrailingWhitespaces()

" space as leader key
let mapleader = " "

" Leader keybinds
nnoremap <leader>s :nohl<CR>

" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>

"
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "ruby", "lua", "go" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,
}

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
EOF


" abecodes/tabout.nvim
" lua require('tabout').setup{}

" lsp-zero
lua <<EOF
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()
EOF

" szw/vim-maximizer
nnoremap <silent> <C-w>m :MaximizerToggle!<CR>

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-q> :Ttoggle<CR>
inoremap <c-q> <Esc>:Ttoggle<CR>
tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

if has('nvim') " Escape terminal mode
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif

" nvim-telescope/telescope.nvim
lua << EOF
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end

_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end

local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim" -- add this value
    }
  }
})
EOF

nnoremap <leader>fn :Telescope git_files<CR>
nnoremap <leader>fd :lua telescope_find_files_in_path()<CR>
nnoremap <leader>fD :lua telescope_live_grep_in_path()<CR>
nnoremap <leader>fo :Telescope file_browser<CR>
nnoremap <leader><space> :lua require("telescope.builtin").find_files({no_ignore=true})<CR>
nnoremap <leader>fg :Telescope git_branches<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fs :Telescope lsp_document_symbols<CR>
nnoremap <leader>ff :Telescope live_grep<CR>
nnoremap <leader>FF :Telescope grep_string<CR>

" nvim-telescope/telescope-fzy-native.nvim
lua require('telescope').load_extension('fzf')

" kyazdani42/nvim-web-devicons

" kyazdani42/nvim-tree.lua
lua require("nvim-tree").setup()

nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tF :NvimTreeFocus<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
nnoremap <leader>tc :NvimTreeCollapse<CR>

" qpkorr/vim-bufkill
let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'kill'

" lukas-reineke/indent-blankline.nvim
lua <<EOF
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- show_current_context = true,
    -- show_current_context_start = true,
  show_trailing_blankline_indent = false
}
EOF

" theme
" lua <<EOF
" vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

" require("catppuccin").setup()

" vim.cmd [[colorscheme catppuccin]]
" EOF

colorscheme dracula

" highlight Normal guibg=none
" highlight NonText guibg=none
lua <<EOF
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
EOF

" lua <<EOF
" vim.g.tokyonight_style = "night"
" vim.cmd[[colorscheme tokyonight]]
" EOF

" hoob3rt/lualine.nvim
lua << EOF
  require('lualine').setup({
  options = {
    theme = "dracula"
   }
  })
EOF

" lewis6991/gitsigns.nvim
lua require('gitsigns').setup({})

