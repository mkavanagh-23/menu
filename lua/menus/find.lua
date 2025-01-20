
  return {
    name = "Find & Replace",
    cmd = function()
      -- Get the dimensions of the current window and calculate the center position
      local width = vim.o.columns
      local height = vim.o.lines
      local win_width = 80  -- Width of the floating window
      local win_height = 30 -- Height of the floating window
      local col = math.floor((width - win_width) / 2)
      local row = math.floor((height - win_height) / 2)

      -- Create a floating window
      local opts = {
        relative = 'editor',
        width = win_width,
        height = win_height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'single',
      }
      local buf = vim.api.nvim_create_buf(false, true)   -- Create an empty buffer
      local win = vim.api.nvim_open_win(buf, true, opts) -- Open a floating window with the buffer

      -- Open terminal in the floating window and get the job ID
      local job_id = vim.fn.termopen("serpl", {
        on_exit = function(_, exit_code)
          if exit_code ~= 0 then
            print("Terminal job failed!")
          end
        end
      })

      -- Set the window height as per the requirement
      vim.api.nvim_win_set_height(win, win_height)
      vim.api.nvim_buf_set_option(buf, 'filetype', 'terminal')
      vim.cmd('startinsert') -- Start insert mode for the terminal
      vim.wo.winbar = ''     -- Disable winbar in the terminal
    end,
    rtxt = "󱁐find",
  }
