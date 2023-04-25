local ok, web_devicons = pcall(require, "nvim-web-devicons")

if not ok then
    return
end

-- local colors = require("theme").colors

web_devicons.setup {
    default = true,
}
