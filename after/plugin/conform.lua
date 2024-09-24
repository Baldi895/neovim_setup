local conform = require("conform")

conform.setup({
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform will run multiple formatters sequentially
      python = { "isort", "black" },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { "rustfmt", lsp_format = "fallback" },
      -- Conform will run the first available formatter
      javascript = { "prettierd", "prettier", stop_after_first = true },

      cpp = {"clang-format"},
      c = {"clang-format"},
      CMakeFiles = {"cmakelang"},
      html = {"prettierd"},
      css = {"prettierd"},
    },
  })

vim.keymap.set({"n","v"}, "<leader>l", function()
    conform.format(
        {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        }
    )
end, {desc = "Format file or range (visual or normal mode)"}
)
format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true
}
