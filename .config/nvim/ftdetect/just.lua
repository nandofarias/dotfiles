vim.filetype.add({
  extension = {
    just = "just"
  },
filename = {
    Justfile = "just",
    justfile = "just",
    [".Justfile"] = "just",
    [".justfile"] = "just"
  }
})
