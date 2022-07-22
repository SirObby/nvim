-- Hello there!
-- For some reason I can't get this to format.
require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'wojciechkepka/vim-github-dark'

    -- use 'hrsh7th/nvim-cmp'

    use {
        "hrsh7th/nvim-cmp",
        requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", 'quangnguyen30192/cmp-nvim-ultisnips',
                    'hrsh7th/cmp-nvim-lua', 'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
                    'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'}
    }

    use {
        'phaazon/hop.nvim',
        branch = 'master', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup {
                keys = 'etovxqpdygfblzhckisuran'
            }
        end
    }

use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        config = function()
            require'nvim-tree'.setup {}
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 'SirVer/ultisnips'

    use 'nvim-lua/plenary.nvim'

    use 'jose-elias-alvarez/null-ls.nvim'

    use 'github/copilot.vim'
    -- use 'mhartington/formatter.nvim'
		
		use 'nvim-treesitter/playground'

		-- User interface
use {
  "stevearc/dressing.nvim",
  event = "BufEnter",
  config = function()
    require("dressing").setup {
      select = {
        backend = { "telescope", "fzf", "builtin" },
      },
    }
  end,
}

	use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {'shadmansaleh/IRC.nvim', rocks = 'openssl',
}

use 'folke/tokyonight.nvim'

end)

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

  require'irc'.setup({
      servers = {
        libera = {
          nick = 'sirobsidian',
          username = 'sirobsidian',
          server = 'irc.libera.chat',
          port = 6667,
          use_ssl = true,
        },
      },
      statusline = true,
    })

require'lspconfig'.pyright.setup {}
-- require'lspconfig'.ccls.setup {}
require'lspconfig'.clangd.setup{}
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false
            }
        }
    }
}
-- require'lspconfig'.lua.setup{}
-- require'lspconfig'.c.setup{}
-- require'lspconfig'.lua.setup{}

-- require('formatter').setup(...)

vim.cmd([[
  "colorscheme ghdark
	colorscheme tokyonight

  set mouse=a
  set number

  set autoindent
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2

  set guifont=LiberationMono\ NF:h9

  "nnoremap <silent> <leader>ff :lua vim.lsp.buf.formatting()<CR>

  " system clipboard
    nmap <c-c> "+y
	vmap <c-c> "+y
	nmap <c-v> "+p
	inoremap <c-v> <c-r>+
	cnoremap <c-v> <c-r>+
	" use <c-r> to insert original character without triggering things like auto-pairs
	inoremap <c-r> <c-v>

	"NvimTreeOpen

	"set wrap
	set whichwrap+=<,>,h,l,[,]

	" Find files using Telescope command-line sugar.
	"nnoremap <leader>ff <cmd>Telescope find_files<cr>
	"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	"nnoremap <leader>fb <cmd>Telescope buffers<cr>
	"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

	" Using Lua functions
  
]])

-- init.lua

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = false,
    auto_reload_on_write = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    update_to_buf_dir = {
        enable = true,
        auto_open = true
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = ""
        }
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    actions = {
        change_dir = {
            global = false
        },
        open_file = {
            quit_on_open = false
        }
    }
}

require('lualine').setup()

require'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "all",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = {"javascript"},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        --disable = {"c", "rust"},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    }
}

_G.formatting = function(bufnr)
    bufnr = tonumber(bufnr) or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        { textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
        function(err, res)
            if err then
                local err_msg = type(err) == "string" and err or err.message
                -- you can modify the log message / level (or ignore it completely)
                vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
                return
            end

            -- don't apply results if buffer is unloaded or has been modified
            if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
                return
            end

            if res then
                vim.lsp.util.apply_text_edits(res, bufnr)
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent noautocmd update")
                end)
            end
        end
    )
end

local null_ls = require("null-ls")

null_ls.setup({
    -- add your sources / config options here
    sources = ...,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            -- wrap in an augroup to prevent duplicate autocmds
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePost <buffer> lua formatting(vim.fn.expand("<abuf>"))
            augroup END
            ]])
        end
    end,
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = {
    noremap = true,
    silent = false
}
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)



-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'Ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)


end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'pyright', 'rust_analyzer', 'tsserver', "clangd"}
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be the default in neovim 0.7+
            debounce_text_changes = 150
        }
    }
end

-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ['<CR>'] = cmp.mapping.confirm({
            select = true
        }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({{
        name = 'nvim_lsp'
    }, {
        name = 'vsnip'
    } -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
    }, {{
        name = 'buffer'
    }})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({{
        name = 'cmp_git'
    } -- You can specify the `cmp_git` source if you were installed it. 
    }, {{
        name = 'buffer'
    }})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {{
        name = 'buffer'
    }}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })

-- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities

--vim.lsp.buf.formatting()

require'hop'.setup { jump_on_sole_occurrence = false }

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}


vim.api.nvim_set_keymap('n', 'ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
vim.api.nvim_set_keymap('n', 'fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
vim.api.nvim_set_keymap('n', 'fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
vim.api.nvim_set_keymap('n', 'fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)

vim.cmd([[

" Using Lua functions
"nnoremap ff <leader> lua require('telescope.builtin').find_files()
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()

"terminal
"vnew term://bash
]])
