local M = {}

-- return current status of AsyncRun job
-- requires asyncrun.vim
local async_status_old = ''
function M.get_asyncrun_running()
    if(vim.api.nvim_eval('exists("g:asyncrun_status")') == 1) then
        local async_status = vim.api.nvim_get_var('asyncrun_status')
        if(async_status ~= async_status_old) then
            async_status_old = async_status
        end
        return async_status
    end
end

-- return current buffer's indentation style
-- Used best with vim-sleuth
function M.get_buf_indentation_style()
    if(vim.api.nvim_buf_get_option(0, 'expandtab')) then
        return "spaces"
    else
        return "tabs"
    end
end

return M
