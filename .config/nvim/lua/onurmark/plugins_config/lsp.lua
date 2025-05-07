local ok, mason = pcall(require, 'mason')

if not ok then
  return
end

mason.setup()

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('onurmark.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method('textDocument/codeAction') then
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end

    if client:supports_method('textDocument/inlayHint') then
      vim.keymap.set({ 'n', 'v' }, '<leader>ch', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end)
    end

    if client:supports_method('textDocument/rename') then
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    end

    if client:supports_method('textDocument/declaration') then
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
    end

    if client:supports_method('textDocument/definition') then
      vim.keymap.set('n', '<leader>gc', vim.lsp.buf.declaration, {})
    end

    if client:supports_method('textDocument/implementation') then
      vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
    end

    if client:supports_method('textDocument/references') then
      vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, {})
    end

    if client:supports_method('textDocument/hover') then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end

    if client:supports_method('textDocument/implementation') then
      vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float, {})
      vim.keymap.set('n', '<leader>ep', function()
        vim.diagnostic.jump({ count = -1, float = true })
      end)
      vim.keymap.set('n', '<leader>en', function()
        vim.diagnostic.jump({ count = 1, float = true })
      end)
      vim.keymap.set('n', '<leader>eq', function()
        vim.diagnostic.setqflist()
      end)
    end

    if client:supports_method('textDocument/formatting') then
      vim.keymap.set('n', '=', function()
        vim.lsp.buf.format { async = true }
      end)
    end

    -- Switch c source / header
    vim.keymap.set('n', '<Leader><Tab>', ':LspClangdSwitchSourceHeader<CR>', {
      desc = "Switch source/header",
      silent = true
    })
  end,
})

vim.lsp.config('lua_ls', {
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
})

vim.lsp.config('ts_ls', {
  settings = {
    filetypes = {
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    cmd = {
      "typescript-language-server",
      "--stdio"
    }
  }
})

vim.lsp.config('emmet_ls', {
  settings = {
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
      "vue",
      "xml"
    },
    init_options = {
      html = {
        options = {
          ["bem.enabled"] = true,
        },
      },
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'clangd',
    'rust_analyzer',
    'angularls',
    'ts_ls',
    'dockerls',
    'emmet_ls',
    'mesonlsp'
  },
})
