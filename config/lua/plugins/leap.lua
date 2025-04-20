return {

{
  'vim-repeat',
  dep_of = { 'leap.nvim' },
},

{
  'leap.nvim',
  lazy = false, -- Leap lazy loads itself
  after = function()
    local leap = require'leap'
    local leap_user = require'leap.user'

    leap.set_default_mappings()
    leap_user.set_repeat_keys('<enter>', '<backspace>')

    leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
    leap.opts.preview_filter =
      function (ch0, ch1, ch2)
        return not (
          ch1:match('%s') or
          ch0:match('%a') and ch1:match('%a') and ch2:match('%a')
        )
      end
  end
},

}

