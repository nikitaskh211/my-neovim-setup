require('toggleterm').setup{
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- Hide the window number for the terminal windows
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 0.3, -- 0 to 1 for the amount of shading to apply
  start_in_insert = true,
  persist_size = true,
  direction = 'float',
}
