local M = {}
local util = require 'lspconfig/util'

local root_files = {
    "BUILD", -- Maven
    "BUILD.bzl", -- Maven
    "BUILD.bazel", -- Maven
    "settings.gradle", -- Gradle (multi-project)
    "settings.gradle.kts", -- Gradle (multi-project)
    "build.xml", -- Ant
    "pom.xml", -- Maven
    "WORKSPACE", -- Maven
  }
  
  local fallback_root_files = {
    "BUILD", -- Maven
    "BUILD.bazel", -- Maven
    "BUILD.bzl", -- Maven
    "build.gradle", -- Gradle
    "build.gradle.kts", -- Gradle
  }
  

M.setup = function(on_attach, capabilities)
    local lspconfig = require "lspconfig"

    lspconfig.kotlin_language_server.setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        capabilities = capabilities,
        root_dir = function(fname)
            return util.root_pattern(unpack(root_files))(fname) or util.root_pattern(unpack(fallback_root_files))(fname)
        end
    }
end

return M
