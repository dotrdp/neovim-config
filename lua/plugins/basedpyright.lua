return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        mason = false,
        settings = {
          basedpyright = {
            analysis = {
              ignorePatterns = { "*.pyi" },
              diagnosticSeverityOverrides = {
                reportCallIssue = "warning",
                reportUnreachable = "warning",
                reportUnusedImport = "warning",
                reportUnusedCoroutine = "warning",
                reportUnusedExpression = "none",
              },
              diagnosticMode = "workspace",
              typeCheckingMode = "basic",
              reportCallIssue = "none",
              disableOrganizeImports = true,
            },
          },
        },
      },
    },
  },
}
