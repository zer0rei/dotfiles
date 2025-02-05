-- Install lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local autocmd = vim.api.nvim_create_autocmd

-- Basic settings
vim.opt.termguicolors = true
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.laststatus = 3

-- Don't auto comment new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Auto-resize splits when Neovim is resized
autocmd('VimResized', {
  command = 'tabdo wincmd ='
})

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Clear space key to prevent any default behavior
vim.keymap.set('n', ' ', '', { noremap = true })

-- For better colors in tmux
if vim.env.TMUX then
    vim.opt.background = "dark"
    vim.env.TERM = "screen-256color"
end

-- Plugin specifications
require("lazy").setup({
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Git integration
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Comments
  "numToStr/Comment.nvim",

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                insert = false, -- disable insert mode mappings
                insert_line = false, -- disable insert line mappings
                normal = "ys",
                normal_cur = "yss",
                normal_line = "yS",
                normal_cur_line = "ySS",
                visual = "S",
                visual_line = "gS",
                delete = "ds",
                change = "cs",
            },
        })
    end,
  },

  -- Motion
  "ggandor/leap.nvim",

  -- Auto pairs
  "windwp/nvim-autopairs",

  -- Theme
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("monokai-pro").setup({
            transparent_background = false,
            terminal_colors = true,
            devicons = true,
            filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
        })
        vim.cmd([[colorscheme monokai-pro]])
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    }
  },

  -- Copilot
  "github/copilot.vim",

  -- Avante
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://zllm.data.zalan.do/v1",
        model = "bedrock/anthropic.claude-3-5-sonnet-20241022-v2:0",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
      hints = { enabled = false },
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "echasnovski/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  -- Additional language support
  "rust-lang/rust.vim",
  "styled-components/vim-styled-components",
})

-- Helper function for mapping
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Mappings
    
-- Basic
map('i', 'jj', '<ESC>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>Q', ':q!<CR>')
map('n', '<leader>wq', ':wq<CR>')
map('n', '<C-q>', ':q<CR>')          -- Normal mode
map('i', '<C-q>', '<Esc>:q<CR>')

-- Window navigation
map('n', '<leader>h', '<C-w>h')
map('n', '<C-h>', '<C-w>h')
map('i', '<C-h>', '<ESC><C-w>h')
map('n', '<leader>j', '<C-w>j')
map('n', '<C-j>', '<C-w>j')
map('i', '<C-j>', '<ESC><C-w>j')
map('n', '<leader>k', '<C-w>k')
map('n', '<C-k>', '<C-w>k')
map('i', '<C-k>', '<ESC><C-w>k')
map('n', '<leader>l', '<C-w>l')
map('n', '<C-l>', '<C-w>l')
map('i', '<C-l>', '<ESC><C-w>l')

-- Folding
map('n', 'zz', 'za')
map('n', 'za', 'zA')
map('n', 'zo', 'zR')
map('n', 'zc', 'zM')
map('n', '<leader>fs', ':set foldmethod=syntax<CR>')
map('n', '<leader>fi', ':set foldmethod=indent<CR>')
map('n', 'z{', 'zfi{')
map('n', 'z[', 'zfi[')

-- Clipboard operations
map('n', '<leader>ycp', ':let @* = expand("%")<CR>')

-- Splits
map('n', '<leader>ss', ':vsplit<CR>')
map('n', '<leader>sv', ':vsplit<CR>')
map('n', '<leader>sh', ':split<CR>')
map('n', '<leader>gf', ':vertical wincmd f<CR>')

-- Tabs
map('n', '<leader>tn', ':tabnew<CR>')
map('n', '<leader>tc', ':tabclose<CR>')

-- Buffer navigation
map('n', '<leader>bl', ':bn<CR>')
map('n', '<leader>Bl', ':bn!<CR>')
map('n', '<leader>bn', ':bn<CR>')
map('n', '<leader>Bn', ':bn!<CR>')
map('n', '<leader>bh', ':bp<CR>')
map('n', '<leader>Bh', ':bp!<CR>')
map('n', '<leader>bp', ':bp<CR>')
map('n', '<leader>Bp', ':bp!<CR>')
map('n', '<leader>bs', ':buffers<CR>')
map('n', '<leader>bb', ':buffers<CR>:buffer<Space>')
map('n', '<leader>Bb', ':buffers<CR>:buffer!<Space>')
map('n', '<leader>bd', ':bd<CR>')
map('n', '<leader>Bd', ':bd!<CR>')

-- Copy to system clipboard
map('n', '<leader>y', '"+y')
map('n', '<leader>yy', '"+Y')
map('v', '<leader>y', '"+y')

-- Paste from system clipboard with proper indentation
map('n', '<leader>p', function()
    vim.cmd('set paste')
    vim.cmd('put +')
    vim.cmd('set nopaste')
end)

-- Preserve visual selection after indent
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Copy entire file to clipboard
map('n', '<leader>ya', ':%y+<CR>')

-- Add line without changing mode or position
map('n', '<leader>o', 'm`o<ESC>``')
map('n', '<leader>O', 'm`O<ESC>``')

-- Config file paths
local config_files = {
    nvim = vim.fn.stdpath("config") .. "/init.lua",  -- Neovim config
    zsh = vim.env.HOME .. "/.zshrc",                 -- Zsh config
    tmux = vim.env.HOME .. "/.tmux.conf"            -- Tmux config
}

-- Edit/save config files
map('n', '<leader>vrc', ':edit ' .. config_files.nvim .. '<CR>')
map('n', '<leader>Vrc', ':edit! ' .. config_files.nvim .. '<CR>')

-- Source Neovim config
map('n', '<leader>vs', function()
    vim.cmd('source ' .. config_files.nvim)
    vim.cmd('nohlsearch')
    vim.notify('Neovim config reloaded!', vim.log.levels.INFO)
end)

-- Edit other config files
map('n', '<leader>zrc', ':edit ' .. config_files.zsh .. '<CR>')
map('n', '<leader>Zrc', ':edit! ' .. config_files.zsh .. '<CR>')
map('n', '<leader>trc', ':edit ' .. config_files.tmux .. '<CR>')
map('n', '<leader>Trc', ':edit! ' .. config_files.tmux .. '<CR>')

-- remove search highlight
map('n', '<leader>nh', ':nohlsearch<CR>')

-- Avante edit
map('v', '<Tab>', '<cmd>AvanteEdit<CR>')
map('n', '<leader>ac', '<cmd>AvanteChat<CR>')

-- Plugin configurations
-- Configure nvim-tree
require('nvim-tree').setup{}

-- Configure lualine
require('lualine').setup{
  options = {
    theme = 'monokai-pro'
  }
}

-- Configure treesitter
require('nvim-treesitter.configs').setup{
  ensure_installed = { "lua", "vim", "javascript", "typescript", "rust", "python" },
  highlight = {
    enable = true,
  },
}

-- Configure telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><Tab>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Configure LSP
local lspconfig

-- Avante system prompt
local function read_system_prompt()
  local file = io.open(vim.env.HOME .. "/.system_prompt.txt", "r")
  if file then
    local content = file:read("*all")
    file:close()
    return content
  end
  return ""
end

vim.api.nvim_create_autocmd("User", {
  pattern = "ToggleMyPrompt",
  callback = function() 
    require("avante.config").override({system_prompt = read_system_prompt()}) 
  end,
})
vim.keymap.set(
  "n", "<leader>ap", function() vim.api.nvim_exec_autocmds(
    "User", { pattern = "ToggleMyPrompt" }
  ) end, { desc = "avante: toggle my prompt" }
)
