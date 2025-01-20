return {

  {
    name = "More Details",
    cmd = vim.lsp.buf.hover,
    rtxt = "󰘶K"
  },

  {
    name = "Goto Definition",
    cmd = vim.lsp.buf.definition,
    rtxt = "gd",
  },

  {
    name = "Goto Declaration",
    cmd = vim.lsp.buf.declaration,
    rtxt = "gD",
  },

  {
    name = "Goto Implementation",
    cmd = vim.lsp.buf.implementation,
    rtxt = "gi",
  },

  {
    name = "Show References",
    cmd = vim.lsp.buf.references,
    rtxt = "gr",
  },

  { name = "separator" },

  {
    name = "Format Buffer",
    cmd = function()
      local ok, conform = pcall(require, "conform")

      if ok then
        conform.format { lsp_fallback = true }
      else
        vim.lsp.buf.format({ async = true })
      end
    end,
    rtxt = "󱁐fmt",
  },

  {
    name = "Code Actions",
    cmd = vim.lsp.buf.code_action,
    rtxt = "󱁐ca",
  },

  {
    name = "Rename Buffer",
    cmd = vim.lsp.buf.rename,
    rtxt = "󱁐rn"
  },
}
