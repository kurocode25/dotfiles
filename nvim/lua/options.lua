local options = {
  tabstop = 2,
  shiftwidth  =2,
  smarttab = true,
  number = true,
	expandtab = true,
  autoindent = true,
	foldmethod = marker,
  hlsearch = true,
  termguicolors = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
