return {
  {
    'L3MON4D3/LuaSnip',
    config = function(opts)
      require('luasnip').setup(opts)
      require('luasnip.loaders.from_snipmate').load { paths = '/home/kamil/.config/nvim/lua/cookie/plugins/snippets' }
    end,
  },
}
