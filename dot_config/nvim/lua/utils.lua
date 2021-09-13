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

M.all_colours = {
    my_colours = {
        greshade1 = "#212121",
        greshade2 = "#424242",
        greshade3 = "#616161",
        greshade4 = "#757575",
        greshade5 = "#9E9E9E",
        greshade6 = "#BDBDBD",
        greshade7 = "#D4D4D4",
        greshade8 = "#EEEEEE",
    },
    onedark_colours = {
        black = "#282C34",
        skyblue = "#61AFEF",
        cyan = "#56B6C2",
        green = "#98C379",
        oceanblue = "#3A4f91",
        magenta = "#C678DD",
        orange = "#E08841",
        red = "#E06C75",
        violet = "#9E93E8",
        white = "#ABB2BF",
        yellow = "#E5C07B",
    },
    nord_colours = {
        -- Polar Night
        nord0 = "#2E3440",
        nord1 = "#3B4252",
        nord2 = "#434C5E",
        nord3 = "#4C566A",
        -- Snowstorm
        nord4 = "#D8DEE9",
        nord5 = "#E5E9F0",
        nord6 = "#ECEFF4",
        -- Frost
        nord7 = "#8FBCBB",
        nord8 = "#88C0D0",
        nord9 = "#81A1C1",
        nord10 = "#5E81AC",
        -- Aurora
        nord11 = "#BF616A",
        nord12 = "#D08770",
        nord13 = "#EBCB8B",
        nord14 = "#A3BE8C",
        nord15 = "#B48EAD",
    }
}

return M
