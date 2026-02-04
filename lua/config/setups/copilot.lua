local M = {}

function M.setup()
  local ok, copilot = pcall(require, 'copilot')
  if not ok then
    return
  end

  copilot.setup({
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = '<C-l>',
        next = '<C-]>',
        prev = '<C-k>',
        dismiss = '<C-\\>',
      },
    },
    panel = { enabled = false },
  })
end

return M
