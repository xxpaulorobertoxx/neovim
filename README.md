# Neovim Config

Configuraçao focada em produtividade com um "kit Cursor-like": LSP completo, busca rapida, diagnósticos, snippets, Git integrado e IA no fluxo.

**Visao Geral**
- Gerenciador de plugins: `packer.nvim`.
- LSP: `mason.nvim` + `mason-lspconfig.nvim` + `nvim-lspconfig`.
- Autocomplete: `nvim-cmp`.
- Snippets: `LuaSnip` + `friendly-snippets`.
- Busca/Jump: `telescope.nvim` + `telescope-fzf-native`.
- Diagnosticos: `trouble.nvim`.
- Descoberta de atalhos: `which-key.nvim`.
- Git: `gitsigns.nvim` + `blame.nvim`.
- UI: `lualine.nvim`, `bufferline.nvim`, `dressing.nvim`, `scrollbar.nvim`.
- AI: `copilot.lua` + `codecompanion.nvim`.
- Files: `nvim-tree.lua` (com `.git` e `.github` ocultos).
- Formatting: `conform.nvim`.
- Syntax: `nvim-treesitter`.

**Instalacao**
1. Execute o script de dependencias no macOS:
   - `./install_darwin.sh`
2. Abra o Neovim e instale plugins:
   - `:PackerSync`
3. Instale/atualize parsers do Tree-sitter:
   - `:TSUpdate`
4. LSPs via Mason:
   - `:Mason`

**Dependencias Recomendadas**
- `git`
- `ripgrep` (para `live_grep` no Telescope)
- `fd` (para busca de arquivos no Telescope)
- `node` e `npm` (Copilot/CodeCompanion e alguns LSPs)
- `python3` + `pynvim`
- `go` (para ferramentas Go)
- `rust` + `cargo` (para LSPs Rust e builds nativos)
- `make` (para `telescope-fzf-native`)

**NvimTree**
- `.git` e `.github` ficam ocultos via `filters.custom`.
- Ajuste em `lua/config/setups/nvim-tree.lua` se quiser mostrar:
  - Remova `custom = { "^%.git$", "^%.github$" }`

**Atalhos Principais**
Leader: `Espaco`

NvimTree:
- `<C-n>` toggle
- `<Leader>e` focus

Telescope:
- `<Leader>ff` buscar arquivos
- `<Leader>fg` buscar texto no projeto
- `<Leader>fs` buscar palavra sob o cursor
- `<Leader>fb` listar buffers
- `<Leader>fd` buscar diagnosticos
- `<Leader>fr` retomar ultima busca

LSP:
- `<Leader>df` ir para definicao
- `<Leader>dc` ir para declaracao
- `<Leader>gi` ir para implementacoes
- `<Leader>dt` ir para definicao de tipo
- `<Leader>lr` listar referencias
- `<Leader>r` renomear simbolo
- `<Leader>ca` acoes de codigo
- `<Leader>k` hover do simbolo
- `<Leader>s` assinatura da funcao

Diagnosticos:
- `<Leader>d` diagnostico flutuante
- `<Leader>db` anterior
- `<Leader>dp` proximo

Trouble:
- `<Leader>xx` abrir/fechar
- `<Leader>xw` diagnosticos do workspace
- `<Leader>xd` diagnosticos do arquivo
- `<Leader>xq` quickfix
- `<Leader>xl` location list

Buffers:
- `<Tab>` proximo buffer
- `<S-Tab>` buffer anterior
- `<Leader>x` fechar buffer atual
- `<Leader>X` fechar outros buffers
- `<Leader>1`...`<Leader>9` ir para buffer
- `<Leader>$` ir para ultimo buffer

IA:
- `<Leader>ac` abrir chat (CodeCompanion)
- `<Leader>ai` prompt inline (CodeCompanion)
- `<Leader>aa` acoes (CodeCompanion)

Outros:
- `<Leader>w` alternar entre janelas
- `<Leader>t` Tagbar toggle
- `<F5>/<F10>/<F11>/<F12>` DAP (requer `nvim-dap`)
- `<Leader>b` breakpoint (requer `nvim-dap`)

**Notas**
- Se o `telescope-fzf-native` falhar, instale `make` e rode `:PackerSync` novamente.
- Para alterar o tema, edite `init.lua` e ajuste `colorscheme`.
