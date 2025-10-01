local terminal_instances = {}

local function create_floating_terminal(command, instance_name)
  instance_name = instance_name or "default"

  if not terminal_instances[instance_name] then
    terminal_instances[instance_name] = {
      buf = nil,
      win = nil,
      is_open = false,
      command = command
    }
  end

  local state = terminal_instances[instance_name]

  if state.is_open and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, false)
    state.is_open = false
    return
  end

  if not state.buf or not vim.api.nvim_buf_is_valid(state.buf) then
    state.buf = vim.api.nvim_create_buf(false, true)
    vim.bo[state.buf].bufhidden = 'hide'
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  state.win = vim.api.nvim_open_win(state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.wo[state.win].winblend = 0
  vim.wo[state.win].winhighlight = 'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder'

  vim.api.nvim_set_hl(0, "FloatingTermNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatingTermBorder", { bg = "none", })

  local has_terminal = false
  local lines = vim.api.nvim_buf_get_lines(state.buf, 0, -1, false)
  for _, line in ipairs(lines) do
    if line ~= "" then
      has_terminal = true
      break
    end
  end

  if not has_terminal then
    vim.fn.termopen(command or os.getenv("SHELL"))
  end

  state.is_open = true
  vim.cmd("startinsert")

  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = state.buf,
    callback = function()
      if state.is_open and vim.api.nvim_win_is_valid(state.win) then
        vim.api.nvim_win_close(state.win, false)
        state.is_open = false
      end
    end,
    once = true
  })
end

local function FloatingTerminal()
  create_floating_terminal(nil, "default")
end

local function FloatingLazygit()
  create_floating_terminal("lazygit", "lazygit")
end

local function FloatingHtop()
  create_floating_terminal("htop", "htop")
end

_G.FloatingTerminal = FloatingTerminal
_G.FloatingLazygit = FloatingLazygit
_G.FloatingHtop = FloatingHtop
_G.create_floating_terminal = create_floating_terminal
_G.terminal_instances = terminal_instances
