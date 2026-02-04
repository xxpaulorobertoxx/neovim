local M = {}

function M.setup()
  local ok, codecompanion = pcall(require, 'codecompanion')
  if not ok then
    return
  end

  codecompanion.setup({
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {})
      end,
    },
    strategies = {
      chat = { adapter = 'copilot' },
      inline = { adapter = 'copilot' },
    },
    display = {
      chat = {
        window = { layout = 'vertical', width = 0.4 },
        start_in_insert_mode = true,
      },
    },
  })
end

return M
