
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd("terminal", false)
    vim.cmd("startinsert", false)
end)


return {

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    "eandrju/cellular-automaton.nvim",
}

