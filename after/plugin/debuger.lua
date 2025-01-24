local dap, dapui = require("dap"), require("dapui")
dapui.setup()

require("mason").setup()
require("mason-nvim-dap").setup({
	ensure_installed = { "js" },
})

vim.keymap.set("n", "tb", dap.toggle_breakpoint, {})
vim.keymap.set("n", "tc", dap.clear_breakpoints, {})
vim.keymap.set("n", "tn", dap.continue, {})
vim.keymap.set("n", "tm", dapui.toggle, {})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭕", texthl = "", linehl = "", numhl = "" })

dap.adapters["pwa-node"] = {
	type = "server",
	host = "localhost",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug-adapter",
		args = { "${port}" },
	},
}

dap.configurations.javascript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch JS file",
		cwd = "${workspaceFolder}",
		program = "${file}",
		runtimeExecutable = "node",
		console = "integratedTerminal",
	},
}

dap.configurations.typescript = {
	{
		type = "pwa-node",
		request = "launch",
		name = "Launch Current File (pwa-node with ts-node)",
		cwd = "${workspaceFolder}",
		program = "${file}",
		runtimeExecutable = "node",
		runtimeArgs = { "--no-warnings=ExperimentalWarning", "--loader", "ts-node/esm" },
		skipFiles = {
			"<node_internals>/**",
			"node_modules/**",
		},
		resolveSourceMapLocations = {
			"${workspaceFolder}/**",
			"!**/node_modules/**",
		},
		console = "integratedTerminal",
	},
}
