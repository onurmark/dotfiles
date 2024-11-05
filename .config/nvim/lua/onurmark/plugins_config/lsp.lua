local ok, mason = pcall(require, 'mason')

if not ok then
  return
end

mason.setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'clangd',
    'rust_analyzer',
    'angularls',
    'ts_ls',
    'dockerls'
  }
})

local rt = require("rust-tools")

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', '=', function()
    vim.lsp.buf.format { async = true }
  end)
  -- -- Hover actions
  -- vim.keymap.set("n", "K", rt.hover_actions.hover_actions, {})
  -- -- Code action groups
  -- vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

require('lspconfig').clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

rt.setup({
  server = {
    on_attach = on_attach,
  },
})

require('lspconfig').ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  cmd = {
    "typescript-language-server",
    "--stdio"
  }
}

require('lspconfig').angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue"
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  }
}
