![logo](https://user-images.githubusercontent.com/31720261/156893394-a14a7fee-749c-4d02-8bfd-1a4cb2c479dd.png)

# 🎄 The Matrix Theme

The Matrix Theme with full support for treesitter!

## 🤔 Why?

Because it's The Matrix!

## 📸 Pretty pictures

#### 🔍 Telescope

_inspired by https://github.com/NvChad/NvChad (You have to enable it via config variable)_
![telescope-theme](https://user-images.githubusercontent.com/31720261/151669762-1470aa12-b6ff-47c1-a4e9-ec9b37e0eabe.png)

## ⚙️ Installation

```vim
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
...
colorscheme gruvbox-baby
```

## 🪛 Configuration

> ❗️ configuration needs to be set **BEFORE** loading the color scheme with `colorscheme gruvbox-baby`

| Option               | Default     | Available options                                |
| -------------------- | ----------- | ------------------------------------------------ |
| background_color     | `medium`    | `medium`, `dark`                                 |
| transparent_mode     | `false`     | `false`, `true` - sets background colors to None |
| comment_style        | `italic`    | see `:h attr-list`                               |
| keyword_style        | `italic`    | see `:h attr-list`                               |
| string_style         | `nocombine` | see `:h attr-list`                               |
| function_style       | `bold`      | see `:h attr-list`                               |
| variable_style       | `NONE`      | see `:h attr-list`                               |
| highlights           | `{}`        | override highlights with your custom highlights  |
| color_overrides      | `{}`        | override color palette with your custom colors   |
| use_original_palette | `false`     | use the original gruvbox palette                 |

```lua
-- Example config in Lua
vim.g.gruvbox_baby_function_style = "NONE"
vim.g.gruvbox_baby_keyword_style = "italic"

-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
vim.g.gruvbox_baby_highlights = {Normal = {fg = "#123123", bg = "NONE", style="underline"}}

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-baby]]
```

If you enable the telescope theme, I recommend using it with this borderchars config:

```lua
telescope.setup({
  defaults = {
    ...
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { " " },
    },
  }
})
```

```vim
" Example config in VimScript
let g:gruvbox_baby_function_style = "NONE"
let g:gruvbox_baby_keyword_style = "italic"

" Enable telescope theme
let g:gruvbox_baby_telescope_theme = 1

" Enable transparent mode
let g:gruvbox_baby_transparent_mode = 1

" Load the colorscheme
colorscheme gruvbox-baby
```

If you want access to the palette you have to do this:

```lua
local colors = require("gruvbox-baby.colors").config()
vim.g.gruvbox_baby_highlights = {Normal = {fg = colors.orange}}
```

## 🔌 Plugin support

- https://github.com/mhinz/vim-startify
- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/kyazdani42/nvim-tree.lua
- https://github.com/phaazon/hop.nvim
- https://github.com/lukas-reineke/indent-blankline.nvim
- https://github.com/hrsh7th/nvim-cmp
- https://github.com/nvim-telescope/telescope.nvim
- https://github.com/nvim-lualine/lualine.nvim

#### enable Lualine

To enable `gruvbox-baby` theme for `Lualine`, simply specify it in your lualine settings:

```
require('lualine').setup {
    options = {
        -- ... your lualine config,
        theme = "gruvbox-baby",
        -- ... your lualine config,
    }
}
