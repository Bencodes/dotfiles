vim.lsp.config("kotlin_language_server", {
	root_markers = {
		"BUILD",
		"BUILD.bzl",
		"BUILD.bazel",
		"settings.gradle",
		"settings.gradle.kts",
		"build.xml",
		"pom.xml",
		"WORKSPACE",
		"build.gradle",
		"build.gradle.kts",
	},
})
