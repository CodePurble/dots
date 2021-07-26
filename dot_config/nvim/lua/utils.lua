local M = {}

-- return current status of AsyncRun job
-- requires asyncrun.vim
local async_status_old = ""
function M.get_asyncrun_running()
    local async_status = ""
    if(vim.api.nvim_eval('exists("g:asyncrun_status")') == 1) then
        async_status = vim.api.nvim_get_var('asyncrun_status')
        if(async_status ~= async_status_old) then
            async_status_old = async_status
        end
    end
    return async_status
end

-- return current buffer's indentation style
-- Used best with vim-sleuth
function M.get_buf_indentation_style()
    local res = ""
    if(vim.api.nvim_buf_get_option(0, 'expandtab')) then
        res = "SP:"
    else
        res = "TB:"
    end
    return res .. vim.api.nvim_buf_get_option(0, 'tabstop')
end

-- ref:
-- https://github.com/ChristianChiarulli/LunarVim/blob/d1bed12764e65d3a4b0a0b6f588fed81c351abb1/lua/core/galaxyline.lua#L126-L149
function M.get_python_venv()
    local function env_cleanup(venv)
        if string.find(venv, "/") then
            local final_venv = venv
            for w in venv:gmatch "([^/]+)" do
                final_venv = w
            end
            venv = final_venv
        end
        return venv
    end
    if vim.bo.filetype == "python" then
        local venv = os.getenv "CONDA_DEFAULT_ENV"
        if venv ~= nil then
            return " :" .. env_cleanup(venv) .. " "
        end
        venv = os.getenv "VIRTUAL_ENV"
        if venv ~= nil then
            return " :" .. env_cleanup(venv) .. " "
        end
        return ""
    end
    return ""
end

return M
