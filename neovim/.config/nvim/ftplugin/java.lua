local jdtls = require('jdtls')
-- File types that signify a Java project's root directory. This will be
-- used by eclipse to determine what constitutes a workspace
local root_markers = { 'gradlew', 'mvnw', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_folder = "/home/crohrmoser/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Helper function for creating keymaps
local function nnoremap(rhs, lhs, bufopts, desc)
	bufopts.desc = desc
	vim.keymap.set("n", rhs, lhs, bufopts)
end

-- Disable semantic highlighting
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		client.server_capabilities.semanticTokensProvider = nil
	end,
});

-- The on_attach function is used to set key maps after the language server
-- attaches to the current buffer
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	-- vim.keymap.set("n", "<leader>gs", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "gj", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "gk", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>c", function() vim.lsp.buf.code_action() end, opts)
	-- vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-Space>", function() vim.lsp.buf.signature_help() end, opts)

	vim.keymap.set("n", "<leader>ds", function() vim.diagnostic.enable() end, { buffer = 0, silent = true })
	vim.keymap.set("n", "<leader>dh", function() vim.diagnostic.disable() end, { buffer = 0, silent = true })

	-- vim.keymap.set("n", "<leader>rc", "<cmd>LspZeroFormat<Cr>")
	vim.keymap.set("n", "<leader>dw", "<Cmd>lua require('dapui').eval()<CR>")
	vim.diagnostic.config({ virtual_text = true, signs = false, underline = false });

	-- Regular Neovim LSP client keymappings
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('v', "<space>c", "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Code actions" })

	-- Java extensions provided by jdtls
	nnoremap("<leader>ro", jdtls.organize_imports, bufopts, "Organize imports")
	nnoremap("<leader>tda", jdtls.test_class, bufopts, "Debug test class")
	nnoremap("<leader>tdn", jdtls.test_nearest_method, bufopts, "Debug nearest test method")
	vim.keymap.set('n', '<Leader>tdl', function() require('dap').run_last() end)
	nnoremap("<leader>tn", "<CMD>TestNearest -Pwwi<CR>", bufopts, "Test nearest method")
	nnoremap("<leader>tl", "<CMD>TestLast <CR>", bufopts, "Test nearest method")
	nnoremap("<leader>ta", "<CMD>TestFile -Pwwi<CR>", bufopts, "Test nearest method")
	nnoremap('<space>rc',
		function() vim.lsp.buf.format { formatting_options = { insertSpaces = false }, async = true } end,
		bufopts,
		"Format file")
end

local config = {
	on_attach = on_attach, -- We pass our on_attach keybindings to the configuration map
	root_dir = root_dir, -- Set the root directory to our found root_marker
	signatureHelp = { enabled = true },
	completion = {
		favoriteStaticMembers = {
			"org.hamcrest.MatcherAssert.assertThat",
			"org.hamcrest.Matchers.*",
			"org.hamcrest.CoreMatchers.*",
			"org.junit.jupiter.api.Assertions.*",
			"java.util.Objects.requireNonNull",
			"java.util.Objects.requireNonNullElse",
			"org.mockito.Mockito.*"
		},
		filteredTypes = {
			"com.sun.*",
			"io.micrometer.shaded.*",
			"java.awt.*",
			"jdk.*", "sun.*",
		},
	},
	sources = {
		organizeImports = {
			starThreshold = 99,
			staticStarThreshold = 99,
		},
	},
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true
				}
			}
		}
	},
	settings = {
		java = {
			eclipse = {
				downloadSources = true
			},
			maven = {
				downloadSources = true
			},
			completion = {
				importOrder = { "java", "javax", "de.wwag" },
			},
			format = {
				enabled = true,
				settings = {
					url = '/home/crohrmoser/.local/share/eclipse/FSJava.xml',
				}
			},
			configuration = {
				maven = {
					userSettings = "/home/crohrmoser/.m2/wwi-settings.xml",
				},
				-- runtimes = {
				--     {
				--         name = "JavaSE-11",
				--         path = "/home/crohrmoser/.sdkman/candidates/java/11.0.17-amzn/",
				--     },
				--     {
				--         name = "JavaSE-17",
				--         path = "/home/crohrmoser/.sdkman/candidates/java/17.0.5-amzn/",
				--     },
				-- },
			}
		},
	},
}

-- The command that starts the language server
-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
config.cmd = {
	'/home/crohrmoser/.sdkman/candidates/java/17.0.7-amzn/bin/java',
	'-javaagent:/home/crohrmoser/.local/share/eclipse/lombok-edge.jar',
	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.protocol=true',
	'-Dlog.level=ALL',
	'-Xms2g',
	'-Xmx8g',
	'--add-modules=ALL-SYSTEM',
	'--add-opens', 'java.base/java.util=ALL-UNNAMED',
	'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
	'-jar',
	'/home/crohrmoser/tools/jdtls-eclipse-latest/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
	'-configuration', '/home/crohrmoser/tools/jdtls-eclipse-latest/config_linux',
	'-data', workspace_folder,
}

local bundles = {
	vim.fn.glob(
		"/home/crohrmoser/tools/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
		1)
};

vim.list_extend(bundles, vim.split(vim.fn.glob("/home/crohrmoser/tools/vscode-java-test/server/*.jar", 1), "\n"))

config['init_options'] = {
	bundles = bundles,
}

vim.lsp.set_log_level("debug")
jdtls.start_or_attach(config)
jdtls.setup_dap { hotcodereplace = "auto" }

vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
vim.cmd "command! -buffer JdtRefreshDebugConfigs lua require('jdtls.dap').setup_dap_main_class_configs()"

-- Options to comply with wwi jdtls formatter
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 4
