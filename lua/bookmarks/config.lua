-- bookmarks.nvim :: configuration
local M = {}

M.defaults = {
  -- Where bookmarks are persisted on disk (JSON).
  storage_path = vim.fn.stdpath("data") .. "/bookmarks.json",

  -- Persist automatically whenever the bookmark list changes.
  auto_save = true,
  -- Load the saved bookmarks automatically on setup().
  auto_load = true,

  -- Sign-column markers for line / location bookmarks (uses extmark signs).
  -- These follow live edits while the buffer is open.
  signs = {
    enable = true,
    line = { text = "▸", texthl = "BookmarksSign" },
    location = { text = "◆", texthl = "BookmarksLocSign" },
  },

  -- Floating popup appearance.
  ui = {
    -- Overall popup width, covering the list pane plus the preview pane when
    -- shown. Fraction of total columns, or an integer >= 1 for absolute cols.
    width = 0.6,
    height = 0.6, -- fraction of total lines  (or an integer >= 1 for absolute)
    border = "rounded",
    title = " Bookmarks ",
  },

  -- Preview window shown beside the popup when there is enough room.
  preview = {
    enable = true,
  },

  -- Keymaps active *inside* the popup window only.
  keymaps = {
    jump = "<CR>",
    delete = "d",
    delete_all = "D",
    next_tab = "<Tab>",
    prev_tab = "<S-Tab>",
    close = { "q", "<Esc>" },
    filter_all = "0",
    filter_files = "1",
    filter_lines = "2",
    filter_locations = "3",
  },
}

M.options = {}

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, opts or {})
  return M.options
end

return M
