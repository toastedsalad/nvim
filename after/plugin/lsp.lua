vim.opt.signcolumn = 'yes'
vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 1500
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, border = "rounded"})]]

local lspconfig = require('lspconfig')

-- Add cmp_nvim_lsp capabilities settings to lspconfig
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = event.buf}
        vim.keymap.set('n', 'H', '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'sr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'sh', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'rs', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F2>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('v', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

-- Setup mason
require("mason").setup()

require('mason-tool-installer').setup({
    ensure_installed = { "netcoredbg" },
})

-- Setup mason-lspconfig with handlers
require("mason-lspconfig").setup {
    ensure_installed = {
      -- "csharp_ls",
      "omnisharp",
      "lua_ls",
      "harper_ls",
      "gopls",
      "pyright"
    }
}

require'lspconfig'.omnisharp.setup {
  cmd = {
    -- '/home/gedaas/.local/share/nvim/mason/packages/omnisharp/omnisharp',
    'omnisharp',
    '-z', -- https://github.com/OmniSharp/omnisharp-vscode/pull/4300
    '--hostPID',
    tostring(vim.fn.getpid()),
    'DotNet:enablePackageRestore=false',
    '--encoding',
    'utf-8',
    '--languageserver',
  },
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
    ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
    ["textDocument/references"] = require('omnisharp_extended').references_handler,
    ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
  },
  settings = {
    RoslynExtensionsOptions = {
      EnableDecompilationSupport = true
    }
  },
}


local util = require('lspconfig.util');

---
-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<tab>'] = cmp.mapping.confirm({select = true})
  }),
})
