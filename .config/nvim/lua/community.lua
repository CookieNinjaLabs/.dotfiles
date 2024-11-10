-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },

  -- INFO: Webdev stuff
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.sql" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.vue" },

  -- INFO: Markdown and latex
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },

  -- INFO: Misc language support
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },

  -- INFO: Utils
  { import = "astrocommunity.editing-support.nvim-regexplainer" },
  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },

  -- WARNING: Apple Stuff
  { import = "astrocommunity.pack.swift" },
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
}
