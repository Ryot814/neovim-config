-- Function to count selected lines and characters
-- It also corresponds to Zenkaku
local function selectionCount()
    local mode = vim.fn.mode()
    local start_line, end_line, start_pos, end_pos

    -- Only active in visual mode
    if not (mode:find("[vV\22]") ~= nil) then return "" end
    start_line = vim.fn.line("v")
    end_line = vim.fn.line(".")

    if mode == 'V' then
        -- In line-wise visual mode, count entire lines
        start_pos = 1
        end_pos = vim.fn.strlen(vim.fn.getline(end_line)) + 1
    else
        start_pos = vim.fn.col("v")
        end_pos = vim.fn.col(".")
    end

    -- Count characters in selection
    local chars = 0
    for i = start_line, end_line do
        local line = vim.fn.getline(i)
        local line_len = vim.fn.strlen(line)
        local s_pos = (i == start_line) and start_pos or 1
        local e_pos = (i == end_line) and end_pos or line_len + 1
        chars = chars + vim.fn.strchars(line:sub(s_pos, e_pos - 1))
    end

    local lines = math.abs(end_line - start_line) + 1
    return tostring(lines) .. " lines, " .. tostring(chars) .. " characters"
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,  -- Enable icons in the statusline
        theme = 'auto',        -- Use automatic theme based on colorscheme
        component_separators = { left = '|', right = '|' },  -- Set component separators to '|'
        section_separators = { left = '', right = '' },    -- Set section separators to empty for a cleaner look
        disabled_filetypes = {},  -- No disabled filetypes
        always_divide_middle = true,  -- Always divide the statusline in the middle
        colored = false,  -- Don't use colors for the entire statusline background
      },
      sections = {
        lualine_a = { 'mode' },  -- Show the current mode
        lualine_b = { 'branch', 'diff' },  -- Show git branch and diff status
        lualine_c = {
          {
            'filename',
            path = 1,  -- Show relative path
            file_status = true,  -- Show file status (readonly, modified)
            shorting_target = 40,  -- Shorten path to leave 40 spaces for other components
            symbols = {
              modified = ' [+]',  -- Symbol for modified file
              readonly = ' [RO]',  -- Symbol for readonly file
              unnamed = 'Untitled',  -- Name for unnamed buffers
            }
          }
        },
        lualine_x = {
          {'searchcount'},  -- Show search count
          {selectionCount},  -- Show count of selected lines and characters
          {
            'diagnostics',  -- Show diagnostics
            sources = { 'nvim_lsp' },  -- Use nvim-lsp as the source
            sections = { 'error', 'warn', 'info', 'hint' },  -- Show all types of diagnostics
            diagnostics_color = {  -- Colors for different diagnostic levels
              error = 'DiagnosticError',
              warn  = 'DiagnosticWarn',
              info  = 'DiagnosticInfo',
              hint  = 'DiagnosticHint',
            },
            symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },  -- Symbols for diagnostics
            colored = true,  -- Use colors for diagnostics
            update_in_insert = false,  -- Don't update diagnostics in insert mode
            always_visible = false,  -- Only show diagnostics when present
          },
        },
        lualine_y = { 'filetype', 'encoding' },  -- Show filetype and encoding
        lualine_z = { 'location', 'progress' }  -- Show cursor location and file progress
      },
      inactive_sections = {  -- Configuration for inactive windows
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {  -- Configuration for tabline
        lualine_a = {
          {
            'buffers',  -- Show buffers in tabline
            mode = 4,  -- Show buffer number + name
            icons_enabled = true,  -- Enable icons for buffers
            show_filename_only = true,  -- Show only filename in buffer name
            hide_filename_extensions = false  -- Don't hide filename extensions
          }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'tabs' }  -- Show tabs in tabline
      },
      extensions = {}  -- No extensions enabled
    }
  end
}
