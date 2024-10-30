-- Main configuration for nvim-cmp (autocompletion plugin)
return {
  'hrsh7th/nvim-cmp',
  version = false, -- Use the latest version of nvim-cmp (avoid locking to a specific version)
  event = 'InsertEnter', -- Load this plugin when entering Insert mode
  dependencies = {
    -- Dependency for LSP completion source, loaded lazily for better performance
    { 'hrsh7th/cmp-nvim-lsp', lazy = true },
    -- Dependency for filesystem path completion source, also lazy-loaded
    { 'hrsh7th/cmp-path', lazy = true },
    -- Dependency for buffer completion source (suggests words from the current buffer), lazy-loaded
    { 'hrsh7th/cmp-buffer', lazy = true },
    {
      -- LuaSnip snippet engine, required for expanding code snippets
      'L3MON4D3/LuaSnip',
      version = 'v2.*', -- Use the latest stable release of LuaSnip v2
      build = 'make install_jsregexp', -- Install jsregexp for advanced regex-based snippets (optional but recommended)
    },
    'saadparwaiz1/cmp_luasnip', -- Adds LuaSnip support to nvim-cmp for autocompletion
    'rafamadriz/friendly-snippets', -- Collection of common snippets for multiple languages
    'onsails/lspkind.nvim', -- Adds VS Code-style pictograms (icons) to the autocompletion menu
  },
  config = function()
    -- Import necessary modules for the setup
    local cmp = require 'cmp' -- nvim-cmp for autocompletion
    local luasnip = require 'luasnip' -- LuaSnip for snippets
    local lspkind = require 'lspkind' -- lspkind for completion menu icons

    -- Load friendly-snippets lazily (collection of snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    -- Set up nvim-cmp with custom options
    cmp.setup {
      -- Configuration for how completion behaves
      completion = {
        completeopt = 'menu,menuone,noselect', -- Configures the completion menu behavior
      },

      -- Define how snippets should expand
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args) -- Expand the snippet using LuaSnip
        end,
      },

      -- Key mappings for interacting with the completion menu and snippets
      mapping = cmp.mapping.preset.insert {
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- Navigate to previous suggestion in completion menu
        ['<C-j>'] = cmp.mapping.select_next_item(), -- Navigate to next suggestion in completion menu
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll up in the completion documentation
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Scroll down in the completion documentation
        ['<C-Space>'] = cmp.mapping.complete(), -- Manually trigger the completion menu
        ['<C-e>'] = cmp.mapping.abort(), -- Close the completion menu without selecting anything
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- Confirm the selection and auto-select the first item
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Select the next item in the completion menu if visible
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump() -- Expand or jump to the next snippet placeholder if possible
          else
            fallback() -- Default behavior (move to next tab stop)
          end
        end, { 'i', 's' }), -- Mapping applies in insert and select modes
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Select the previous item in the completion menu if visible
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1) -- Jump to the previous snippet placeholder if possible
          else
            fallback() -- Default behavior (move to previous tab stop)
          end
        end, { 'i', 's' }), -- Mapping applies in insert and select modes
      },

      -- Sources of completion suggestions
      sources = cmp.config.sources {
        { name = 'nvim_lsp' }, -- Get completions from LSP (Language Server Protocol)
        { name = 'luasnip' }, -- Get snippet completions
        { name = 'buffer' }, -- Get text completions from the current buffer
        { name = 'path' }, -- Get filesystem path completions
      },

      -- Format the appearance of the completion menu, including icons from lspkind
      formatting = {
        fields = { 'abbr', 'kind', 'menu' }, -- Show abbreviation, type (kind), and menu in the completion
        format = lspkind.cmp_format {
          mode = 'symbol_text', -- Display both symbol and text for each suggestion
          maxwidth = 50, -- Limit the width of the completion menu to 50 characters
          ellipsis_char = '...', -- Use '...' to truncate long items
        },
        expandable_indicator = true, -- Show expandable indicator (like for snippets)
      },
    }
  end,
}
