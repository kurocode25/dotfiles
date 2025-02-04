local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- === installed ===
-- colorscheme
Plug 'folke/tokyonight.nvim'

-- Language
Plug 'posva/vim-vue'
Plug 'vmchale/dhall-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'digitaltoad/vim-pug'
Plug('dNitro/vim-pug-complete', { ['for'] = 'pug' })
Plug 'wuelnerdotexe/vim-astro'

-- Editor
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-surround'

-- Complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-omni'

-- LSP
Plug 'neovim/nvim-lspconfig'

-- UI
Plug 'stevearc/dressing.nvim'
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'folke/which-key.nvim'
Plug 'nvim-lua/plenary.nvim'       -- neotree dependency
Plug 'nvim-tree/nvim-web-devicons' -- neotree dependency
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug('akinsho/bufferline.nvim', { ['tag'] = '*' })

-- Skkelton
Plug 'vim-skk/skkeleton'
Plug 'vim-denops/denops.vim'
Plug 'delphinus/skkeleton_indicator.nvim' -- indicator

-- === uninstalled ===
-- Plug 'scrooloose/nerdtree'
-- Plug 'jistr/vim-nerdtree-tabs'
-- Plug 'vim-airline/vim-airline'
-- Plug 'vim-airline/vim-airline-themes'
-- Plug 'neoclide/coc.nvim' , {'blanch': 'master', 'do': 'npm ci'}
-- Plug 'kurocode25/mdforvim'
-- Plug 'catppuccin/nvim'
-- Plug 'tpope/vim-fugitive'
-- Plug 'ryanoasis/vim-devicons'
-- Plug 'chentoast/marks.nvim'
-- Plug 'airblade/vim-gitgutter'
-- Plug 'is0n/fm-nvim'
-- Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

vim.call('plug#end')

-- Setup For Plugins
require("noice").setup()
require("lualine").setup()
require("bufferline").setup()
require("neo-tree").setup({
  close_if_last_window = true
})

-- skkeleton
vim.fn["skkeleton#config"]({
  globalDictionaries = {'~/.skk/SKK-JISYO.L'}
})

require("skkeleton_indicator").setup({})

-- setup for cmplete
vim.opt.complete.opt = "menu, menuone, noselect"
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
    { name = 'path' },
    {
      name = 'omni',
      option = {
        disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' }
      }
    }
  })
})


-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lsp = require('lspconfig')

-- Haskell
require('lspconfig')['hls'].setup{
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

-- Lua
require'lspconfig'.lua_ls.setup{
  capabilities = capabilities,
}

-- CSS
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- Astro
require'lspconfig'.astro.setup{}

-- Rust
lsp.rust_analyzer.setup{}
