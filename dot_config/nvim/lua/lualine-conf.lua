Async_status_old = ''
local function get_asyncrun_running()
    if(vim.api.nvim_eval('exists("g:asyncrun_status")') == 1) then
        local async_status = vim.api.nvim_get_var('asyncrun_status')
        if(async_status ~= Async_status_old) then
            Async_status_old = async_status
        end
        return async_status
    end
end

require'lualine'.setup {
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'branch'},
        lualine_b = {},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', 'fileformat', 'filetype', {get_asyncrun_running}},
        lualine_y = {
            {
                'diagnostics',
                sources = {'nvim_lsp'},
                sections = {'error', 'warn', 'info', 'hint'},
                color_error = '#FF0000',
                color_warn = '#F0F722',
                color_info = '#1176DB',
                color_hint = '#C678DD',
                symbols = {error = '✖ ', warn = ' ', info = ' ', hint = 'ℍ '},
            },
        },
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'quickfix'}
}

