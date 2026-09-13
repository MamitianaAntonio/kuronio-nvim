return {
  -- Theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        opts = {
          theme = "dragon",
          background = {
            dark = "dragon",
            light = "lotus",
          },
          commentStyle = {
            italic = true,
          },
          functionStyle = {
            bold = false,
          },
          keywordStyle = {
            italic = true,
            bold = false,
          },
          statementStyle = {
            bold = false,
          },
          typeStyle = {
            bold = false,
          },
        },
      })

      vim.cmd.colorscheme("kanagawa")

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          require("config.kuronio-theme").apply()
        end,
      })

      require("config.kuronio-theme").apply()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },

  -- Snacks
  {
    "folke/snacks.nvim",

    opts = {
      -- Dashboard
      dashboard = {
        sections = {
          {
            section = "terminal",
            cmd = "chafa --format symbols --symbols vhalf --size 60x10 ~/.config/nvim/assets/kuronio.png; sleep .1",
            height = 8,
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },

      -- Indent
      indent = {
        enabled = true,
        char = "▏",
        only_scope = false,
        only_current = false,
        hl = "SnacksIndent",

        scope = {
          enabled = false,
        },

        chunk = {
          enabled = false,
        },

        animate = {
          enabled = false,
        },
      },
    },

    init = function()
      vim.api.nvim_set_hl(0, "SnacksIndent", {
        fg = "#33322a",
      })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "kanagawa",
        globalstatus = true,

        component_separators = "",
        section_separators = "",

        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
            "starter",
          },
        },

        always_divide_middle = false,

        refresh = {
          statusline = 100,
        },
      },

      sections = {
        -- MODE
        lualine_a = {
          {
            "mode",

            fmt = function()
              local mode_icons = {
                n = "󰆧", -- Normal
                i = "󰏫", -- Insert
                v = "󰈈", -- Visual
                [""] = "󰈈", -- Visual Block
                V = "󰈈", -- Visual Line
                c = "󰘳", -- Command
                R = "󰛔", -- Replace
                t = "󰆍", -- Terminal
              }

              return mode_icons[vim.fn.mode()] or "󰊠"
            end,

            padding = {
              left = 1,
              right = 1,
            },

            color = {
              fg = "#181616",
              bg = "#8f84d6",
              gui = "NONE",
            },
          },
        },

        -- GIT
        lualine_b = {
          {
            "branch",
            icon = "",

            padding = {
              left = 1,
              right = 1,
            },

            color = {
              fg = "#b8aef0",
            },
          },

          {
            "diff",

            symbols = {
              added = "＋",
              modified = "～",
              removed = "－",
            },

            padding = {
              left = 1,
              right = 1,
            },

            colored = true,
          },
        },

        -- FILE
        lualine_c = {
          {
            "filename",
            path = 1,

            symbols = {
              modified = " ●",
              readonly = " ",
              unnamed = "[No Name]",
            },

            color = {
              fg = "#c5c9c5",
            },

            padding = {
              left = 2,
              right = 1,
            },
          },
        },

        -- RIGHT
        lualine_x = {
          {
            "diagnostics",

            symbols = {
              error = "󰅚 ",
              warn = "󰀪 ",
              info = "󰋽 ",
              hint = "󰌶 ",
            },

            colored = true,

            padding = {
              left = 1,
              right = 1,
            },
          },

          {
            "filetype",
            icon_only = true,

            padding = {
              left = 1,
              right = 1,
            },

            color = {
              fg = "#a6a69c",
            },
          },

          {
            function()
              return "│"
            end,

            color = {
              fg = "#3a3a3a",
            },

            padding = 0,
          },

          {
            "location",

            padding = {
              left = 1,
              right = 1,
            },

            color = {
              fg = "#8ba4b0",
            },
          },
        },

        lualine_y = {},

        -- SIGNATURE
        lualine_z = {
          {
            function()
              return "󰔷 Kuronio"
            end,

            padding = {
              left = 1,
              right = 1,
            },

            color = {
              fg = "#181616",
              bg = "#8f84d6",
              gui = "bold",
            },
          },
        },
      },

      -- Inactive
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},

        lualine_c = {
          {
            "filename",
            path = 1,

            color = {
              fg = "#6b6b63",
            },
          },
        },

        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
}
