local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Close blame
    quit_blame = "<leader>g",
    -- Open file/folder in git repository
    browse = "<Leader>go",
  }
})
