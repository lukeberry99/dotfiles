return {
  "lukeberry99/pkms",
  lazy = false,
  config = function()
    require('pkms').setup({
      notes_dir = vim.fn.expand("~/notes"),
      daily_dir = "daily",
      template = "---\ntitle: {title}\ndate: {date}\ntags: [{tags}]\n---\n\n# {title}\n\n",
      tag_format = "yaml",
      open_mode = "vsplit", -- "float" | "split" | "current" | "vsplit"
      float_opts = {
        width = 0.8,
        height = 0.8,
        border = "rounded"
      }
    })
  end
}
