return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set
    local prefix = "<leader>"

    -- Add or skip cursor above/below the main cursor.
    set({ "n", "x" }, prefix .. "k", function()
      mc.lineAddCursor(-1)
    end, { desc = "Add line cursor above" })
    set({ "n", "x" }, prefix .. "j", function()
      mc.lineAddCursor(1)
    end, { desc = "Add line cursor below" })
    set({ "n", "x" }, prefix .. "<left>", function()
      mc.lineSkipCursor(-1)
    end, { desc = "Skip line cursor above" })
    set({ "n", "x" }, prefix .. "<right>", function()
      mc.lineSkipCursor(1)
    end, { desc = "Skip line cursor below" })

    -- Add or skip adding a new cursor by matching word/selection
    set({ "n", "x" }, prefix .. "mj", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor to next match" })
    set({ "n", "x" }, prefix .. "mh", function()
      mc.matchSkipCursor(1)
    end, { desc = "Skip next match" })
    set({ "n", "x" }, prefix .. "mk", function()
      mc.matchAddCursor(-1)
    end, { desc = "Add cursor to previous match" })
    set({ "n", "x" }, prefix .. "ml", function()
      mc.matchSkipCursor(-1)
    end, { desc = "Skip previous match" })

    -- Add and remove cursors with control + left click.
    set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add multi-cursor with mouse" })
    set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Add multi-cursor with mouse" })
    set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Add multi-cursor with mouse" })

    -- Disable and enable cursors.
    set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle multi-cursor" })

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet({ "n", "x" }, prefix .. "h", mc.prevCursor, { desc = "Select previous cursor as main" })

      layerSet({ "n", "x" }, prefix .. "l", mc.nextCursor, { desc = "Select next cursor as main" })

      -- Delete the main cursor.
      layerSet({ "n", "x" }, prefix .. "x", mc.deleteCursor, { desc = "Delete main cursor" })

      -- Enable and clear cursors using escape.
      layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorSign", { link = "SignColumn" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
    hl(0, "MultiCursorDisabledCursor", { reverse = true })
    hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
