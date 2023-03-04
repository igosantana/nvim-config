local status, nt = pcall(require, "nvim-tree")
if (not status) then return end

local status_config, nvim_config = pcall(require, "nvim-tree.config")
if (not status_config) then return end

local tree_cb = nvim_config.nvim_tree_callback

nt.setup({
  sort_by = "name",
  view = {
    width = 30,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "h", cb = tree_cb "split" },
        { key = "x", cb = tree_cb "close_node" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
