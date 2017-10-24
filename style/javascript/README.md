### JavaScript

In additional to the following guidelines, please also install and use [Prettier](https://github.com/prettier/prettier) with your favorite text editor.

##### Prettier Setup

*Atom*
1. Install the [`prettier-atom`](https://atom.io/packages/prettier-atom) package.
1. Configure the settings with the following changes (added to `~/.atom/config.cson`).

  ```cson
  "prettier-atom":
    formatOnSaveOptions:
      enabled: true
      showInStatusBar: true
    prettierOptions:
      parser: "flow"
      singleQuote: true
   ```
*Vim*
1. Install the [vim-prettier](https://github.com/prettier/vim-prettier) plugin using [vim-plug](https://github.com/junegunn/vim-plug)
1. Add the following to your ~/.vimrc to the appropriate places

```viml
" Load vim-prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
 
" Configure vim-prettier
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'

" Detect *.es6 as javascript files
augroup filetypedetect
  au BufRead,BufNewFile *.es6 setfiletype javascript
augroup END

```

##### General
- Prefer `const` and `let` over `var`.
- Prefer to exclude jQuery from new projects.
