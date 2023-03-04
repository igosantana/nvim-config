local status, lspf = pcall(require, "lsp-format")
if (not status) then return end

lspf.setup {}
