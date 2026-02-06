vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- basic options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.hlsearch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- basic keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- plugins
require('lazy').setup({
  -- lsp configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require('mason').setup()

      require('mason-lspconfig').setup {
        ensure_installed = {
          'bashls',
          'lua_ls',
          'marksman',
          'pyright',
          'tinymist',
          'yamlls',
        },
        automatic_installation = true,
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        bashls = { capabilities = capabilities },
        lua_ls = {
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = { globals = { 'vim' } },
            },
          },
        },
        marksman = { capabilities = capabilities },
        pyright = { capabilities = capabilities },
        tinymist = { capabilities = capabilities },
        ts_ls = { capabilities = capabilities },
        typos_lsp = { capabilities = capabilities },
        yamlls = { capabilities = capabilities },
      }

      for server, config in pairs(servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      -- Setup keymaps when LSP attaches
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, func)
            vim.keymap.set('n', keys, func, { buffer = event.buf })
          end

          map('gd', vim.lsp.buf.definition)
          map('gr', vim.lsp.buf.references)
          map('gI', vim.lsp.buf.implementation)
          map('<leader>D', vim.lsp.buf.type_definition)
          map('<leader>rn', vim.lsp.buf.rename)
          map('<leader>ca', function() require('actions-preview').code_actions() end)
          map('K', vim.lsp.buf.hover)
          map('gD', vim.lsp.buf.declaration)
        end,
      })
    end,
  },

  -- nvim-lint for shellcheck diagnostics
  {
    'mfussenegger/nvim-lint',
    ft = { 'sh', 'bash' },
    config = function()
      -- only sets if shellcheck is installed
      if vim.fn.executable('shellcheck') == 1 then
        local lint = require('lint')

        -- configure shellcheck for bash/sh files
        lint.linters_by_ft = {
          sh = { 'shellcheck' },
          bash = { 'shellcheck' },
        }

        -- run shellcheck on save and when entering buffer
        vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter' }, {
          pattern = { '*.sh', '*.bash' },
          callback = function()
            lint.try_lint()
          end,
        })
      end
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  -- fzf
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      require('telescope').setup {
        defaults = {
          -- Disable treesitter highlighting in previews to avoid ft_to_lang errors
          preview = {
            treesitter = false,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep)
      vim.keymap.set('n', '<leader>fb', builtin.buffers)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags)
    end,
  },

  -- treesitter settings
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'lua', 'markdown', 'vim', 'python', 'yaml', 'typst' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- typst preview with tinymist
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '0.3.*',
    build = function()
      require('typst-preview').update()
    end,
    config = function()
      require('typst-preview').setup {
        dependencies_bin = {
          ['tinymist'] = 'tinymist',
          ['websocat'] = nil,  -- will use built-in
        },
      }
    end,
  },

  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup {
        default_file_explorer = true,
        columns = {},  -- no icons
        view_options = {
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },

  {
    'chentoast/marks.nvim',
    config = function()
      require('marks').setup {
        default_mappings = true,
        signs = true,
        mappings = {}
      }
    end,
  },

  {
    'aznhe21/actions-preview.nvim',
    config = function()
      require('actions-preview').setup {
        telescope = {
          sorting_strategy = 'ascending',
          layout_strategy = 'vertical',
          layout_config = {
            width = 0.8,
            height = 0.9,
            prompt_position = 'top',
            preview_cutoff = 20,
            preview_height = function(_, _, max_lines)
              return max_lines - 15
            end,
          },
        },
      }
    end,
  },
{
  "Mofiqul/dracula.nvim",
  lazy = true, -- keep installed but don’t auto-load
},

{
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "medium", -- "soft", "medium", "hard"
      transparent_mode = false,
    })
    vim.cmd.colorscheme("gruvbox")
  end
},
})
