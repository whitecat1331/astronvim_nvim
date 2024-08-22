return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          -- quick save
          -- personal config
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
          ["<A-k>"] = "zz<C-u>",
          ["<A-j>"] = "zz<C-d>",
          ["<A-o>"] = "o<esc>",
          ["<A-O>"] = "O<esc>",
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
          --
          ["<A-k>"] = "zz<C-u>",
          ["<A-j>"] = "zz<C-d>",
          ["<A-o>"] = "o<esc>",
          ["<A-O>"] = "O<esc>",
        },
        v = {
          ["S"] = { ":s///g<left><left><left>", desc = "Find and Replace" },
          ["p"] = { '"_dP', desc = "Paste and re-copy to nvim register" },
          -- ["<C-k>"] = "zz<C-u>",
          -- ["<C-j>"] = "zz<C-d>",
          ["<A-k>"] = "zz<C-u>",
          ["<A-j>"] = "zz<C-d>",
          ["<A-o>"] = "o<esc>",
          ["<A-O>"] = "O<esc>",
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
