local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- 公司會用的 prettier setting:
-- "--print-width 120", "--arrow-parens avoid", "--prose-wrap=preserve", "--trailing-comma=es5"
null_ls.setup({
	debug = false,
	sources = {
		-- formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
		formatting.prettier.with({
			extra_args = {
				"--single-quote",
				"--print-width=120",
				"--prose-wrap=preserve",
				"--trailing-comma=es5",
				"--arrow-parens=avoid",
			},
			filetypes = {
				"typescriptreact",
				"typescript",
				"javascriptreact",
				"javascript",
				"svelte",
				"json",
				"jsonc",
				"css",
				"less",
				"scss",
				"html",
				"vue",
				"yaml",
			},
		}),
		formatting.stylua,

		-- 有 eslint 就開啟
		-- diagnostics.eslint_d.with({
		-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
		-- }),
		-- null_ls.builtins.formatting.eslint_d,
		-- null_ls.builtins.diagnostics.eslint_d,
		-- null_ls.builtins.code_actions.eslint_d,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
