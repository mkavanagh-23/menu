return {

  {
    name = "Inspect",
    cmd = Inspect,

  },

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

  { name = "separator" },

  {
    name = "  Lsp Actions",
    hl = "Exblue",
    items = "lsp",
  },

  { name = "separator" },

  {
    name = "Copy Content",
    cmd = "%y+",
  },

  {
    name = "Delete Content",
    cmd = "%d",
  },

  { name = "separator" },

  {
    name = "  Open in terminal",
    hl = "ExRed",
    cmd = function()
      local old_buf = require("menu.state").old_data.buf
      local old_bufname = vim.api.nvim_buf_get_name(old_buf)
      local old_buf_dir = vim.fn.fnamemodify(old_bufname, ":h")

      local cmd = "cd " .. old_buf_dir

      vim.cmd "enew"
      vim.fn.termopen { vim.o.shell, "-c", cmd .. " ; " .. vim.o.shell }
    end,
  },
}
