local M = {}

function M.setup()
  local languages = {
    "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
    "python", "ruby", "javascript", "arduino", "awk", "c_sharp", "cmake",
    "clojure", "asm", "cpp", "css", "csv", "dart", "dockerfile", "diff",
    "editorconfig", "erlang", "gleam", "go", "gomod", "helm", "haskell",
    "html", "htmldjango", "java", "json", "json5", "kotlin", "nasm",
    "ocaml", "ocaml_interface", "proto", "regex", "rust", "sql", "svelte",
    "toml", "typescript", "yaml", "vue", "xml",
  }

  local ok_legacy, legacy_configs = pcall(require, "nvim-treesitter.configs")
  if ok_legacy then
    legacy_configs.setup({
      ensure_installed = languages,
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
    })
    return
  end

  local ok_new, treesitter = pcall(require, "nvim-treesitter")
  if not ok_new then
    return
  end

  treesitter.setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
  })
  treesitter.install(languages)

  local group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function(args)
      pcall(vim.treesitter.start, args.buf)
    end,
  })
end

return M
