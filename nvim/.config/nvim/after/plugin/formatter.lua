local shfmt = function()
    return {
        exe = "shfmt",
        args = {"-s -i 4"},
        stdin = true
        }
end

require('formatter').setup({
    filetype = {
        c = {
            -- astyle format
            function()
                return {
                    exe = "astyle",
                    args = {"--style=linux -s8"},
                    stdin = true
                    }
            end
        },
        bash = { shfmt },
        sh = { shfmt },
    }
})
