-- Bufferline
return {
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        themable = true,
        separator_style = "thin",

        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,

        offsets = {
          {
            filetype = "snacks_layout_box",
          },
        },
      },

      highlights = {
        buffer_selected = {
          fg = "#dcd7ba",
          bold = true,
          italic = false,
        },

        indicator_selected = {
          fg = "#4d4188",
          bg = "NONE",
        },

        modified_selected = {
          fg = "#5f5499",
        },
      },
    },
  },
}
