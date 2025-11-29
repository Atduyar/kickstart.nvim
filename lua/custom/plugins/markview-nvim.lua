return {
  'OXY2DEV/markview.nvim',
  lazy = false, -- Recommended

  -- For blink.cmp's completion
  -- source
  dependencies = {
    "saghen/blink.cmp"
  },

  opts = function()
    local presets = require("markview.presets")
    local header_colors = {
      { '#cb7676', '#402626' },
      { '#FFA500', '#2D282C' },
      { '#9FCB71', '#252C2C' },
      { '#19BC9C', '#182931' },
      { '#B89AF0', '#29273A' },
      { '#9B7DD4', '#262336' },
    }
    for i = 1, 6 do
      local fg, bg = header_colors[math.min(i, #header_colors)][1], header_colors[math.min(i, #header_colors)][2]
      vim.api.nvim_set_hl(0, '@markup.heading.' .. i .. '.markdown', { fg = fg, bold = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH' .. i, { fg = fg, bold = true })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH' .. i .. 'Bg', { bg = bg })
    end
    vim.api.nvim_set_hl(0, '@markup.quote', { fg = '#F2CDCD' })
    vim.api.nvim_set_hl(0, 'RenderMarkdownQuote', { fg = '#F2CDCD' })

    require("markview.extras.checkboxes").setup();

    return {
      markdown = {
        headings = presets.headings.marker,
      },
    }
  end,
}
