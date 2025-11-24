return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      completions = { lsp = {enabled = true } },
      -- Disable sign column related rendering
      sign = {
        enable = false,
      },
      code = {
        -- Language icon is rendered to the right
        position = 'right',
        -- when lines are empty overlay the above & below icons
        border = 'thin',
        -- Width of code block background
        width = 'block',
        -- Minimum width to use for code blocks when width is 'block'
        min_width = 80,
        -- Amount of padding to add the left/right of code blocks
        left_pad = 1,
        right_pad = 1,
        -- Avoid overriding the background of heading
        hightlight_inline = 'RenderMarkdownCodeInfo',
      },
      heading = {
        icons = { '󰼏 ', '󰎨 ', '󰼑 ', '󰎲 ', '󰼓 ', '󰎴 ' },
        border = true,
        width = 'block',
        min_width = 80,
        -- Render headings in other modes
        render_modes = true,
      },
      dash = {
        width = 80,
      },
      pipe_table = {
        -- Characters used to replace table border
        border = {
          "╭", "┬", "╮",
          "├", "┼", "┤",
          "╰", "┴", "╯",
          "│", "─"
        },
        -- Gets placed in delimiter row for each column, position is based on alignment.
        alignment_indicator = "─",
        anti_conceal = {
          -- Modes to disable anti conceal to show
          disabled_modes = { 'n' },
        },
      },
    }
  }
}

