local colors = {
  rosewater = '#f5e0dc';
  flamingo = '#f2cdcd';
  pink = '#f5c2e7';
  mauve = '#cba6f7';
  red = '#f38ba8';
  maroon = '#eba0ac';
  peach = '#fab387';
  yellow = '#f9e2af';
  green = '#a6e3a1';
  teal = '#94e2d5';
  sky = '#89dceb';
  sapphire = '#74c7ec';
  blue = '#89b4fa';
  text = '#cdd6f4';
  subtext1 = '#bac2de';
  subtext0 = '#a6adc8';
  overlay2 = '#9399b2';
  overlay1 = '#7f849c';
  overlay0 = '#6c7086';
  surface2 = '#585b70';
  surface1 = '#45475a';
  surface0 = '#313244';
  base = '#1e1e2e';
  mantle = '#181825';
  crust = '#11111b';
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.base , bg = colors.green},
    b = { fg = colors.base , bg = colors.mauve},
    c = { bg = colors.crust},
  },

  insert = { a = { fg = colors.base, bg = colors.blue } },
  terminal = { a = { fg = colors.base, bg = colors.sky } },
  visual = { a = { fg = colors.base, bg = colors.yellow } },
  replace = { a = { fg = colors.base, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.overlay0 },
    b = { fg = colors.white, bg = colors.surface1 },
    c = { bg = colors.mantle},
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=',
    },
    lualine_x = {},
    lualine_y = {  'searchcount', 'filetype' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
