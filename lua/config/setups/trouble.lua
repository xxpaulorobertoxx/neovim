local M = {}

function M.setup()
  require("trouble").setup({
    auto_preview = false,
    focus = true,
    use_diagnostic_signs = true,
  })
end

return M
