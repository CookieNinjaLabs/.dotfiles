tex = vim.g
tex.localleader = ','

return {
  'lervag/vimtex',
  lazy = false,
  init = function()
    tex.vimtex_view_method = 'zathura'
    tex.vimtex_view_general_viewer = 'okular'
    tex.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
    tex.vimtex_compiler_method = 'latexmk'
    tex.vimtex_compiler_latexmk = {
      options = {
        '-pdf',
        '-interaction=nonstopmode',
        '-synctex=1',
        '-file-line-error',
        '-outdir=' .. vim.fn.expand '%:p:h',
      },
    }

    vim.api.nvim_buf_set_keymap(0, 'n', '<localleader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true, desc = 'compile tex' })
  end,
}
