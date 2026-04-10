return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup()

      local highlights = {
        "IlluminatedWordText",
        "IlluminatedWordRead",
        "IlluminatedWordWrite",
      }

      -- what to do with variable highlights
      -- refer to https://github.com/ellisonleao/gruvbox.nvim/blob/5e0a460d8e0f7f669c158dedd5f9ae2bcac31437/lua/gruvbox.lua#L285
      -- local hlink = "GruvboxPurpleSign"
      local hlink = "Underlined"
      for _, value in pairs(highlights) do
        vim.api.nvim_set_hl(0, value, { link = hlink })
      end

      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = { "*" },
        callback = function(ev)
          for _, value in pairs(highlights) do
            vim.api.nvim_set_hl(0, value, { link = hlink })
          end
        end,
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
