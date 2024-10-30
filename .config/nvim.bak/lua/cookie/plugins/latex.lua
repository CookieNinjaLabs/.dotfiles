-- Set localleader before Lazy loads
-- Set the localleader key to ','
vim.g.maplocalleader = ','

return {
  {
    'lervag/vimtex',
    lazy = false,
    config = function()
      -- Use Zathura as the PDF viewer
      vim.g.vimtex_view_method = 'zathura'

      -- Use latexmk as the compiler
      vim.g.vimtex_compiler_method = 'latexmk'

      -- Configure latexmk options
      vim.g.vimtex_compiler_latexmk = {
        -- build_dir = 'build', -- Ensure output goes to 'build' directory
        options = {
          -- '-pdf', -- Compile to PDF
          '-interaction=nonstopmode', -- Continue even with errors
          '-synctex=1', -- Enable synctex for forward and reverse search
          '-file-line-error', -- Show file and line number on errors
          -- '-auxdir=auxdir', -- Output files go to 'build' directory
          -- '-outdir=' .. vim.fn.expand '%:p:h',
          -- '-outdir=build',
        },
      }

      -- Ensure Zathura opens the correct PDF
      vim.g.vimtex_view_general_options =
        '--synctex-forward @line:@col:@tex --synctex-editor-command "nvim --headless -u NONE -c "VimtexInverseSearch %1 %2" %1" --fork'

      -- Key mappings for LaTeX compilation and viewing
      vim.api.nvim_set_keymap('n', '<localleader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true, desc = 'Compile LaTeX' })
      vim.api.nvim_set_keymap('n', '<localleader>lv', ':VimtexView<CR>', { noremap = true, silent = true, desc = 'View compiled PDF' })
    end,
  },
}
