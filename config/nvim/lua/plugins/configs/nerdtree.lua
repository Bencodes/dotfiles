local ok, nerdtree = pcall(require, "nerdtree")

if not ok then
    return
end

nerdtree.setup {
}
