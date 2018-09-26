# ProctorU Guides

Guides is a foundation of best practices used by ProctorU's Engineering &
Design team. It includes best practices for Code Reviewing, Style Rules, and
much more.

---

## JavaScript

In additional to the following guidelines, please also install and use [Prettier](https://github.com/prettier/prettier) with your favorite text editor.

### Prettier Setup

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
   
*VSCode*

1. Install the [`prettier-vscode`](https://github.com/prettier/prettier-vscode) package.
1. Configure the Settings with the following changes (added to the User Settings).

  ```json
    "editor.formatOnSave": true,
    "prettier.singleQuote": true,
    "prettier.parser": "flow"
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

### General

- Prefer `const` and `let` over `var`.

- Prefer to exclude jQuery from new projects.

- When jQuery is absolutely necessary (when dealing with old code) and you are assigning variables to jQuery objects, use the dollar sign as a prefix to tell the reader it is a jQuery object, not a DOM object.

    ```es6
    // bad
    const uploadButton = $('[data-behavior="upload-avatar"]');

    // good
    const $uploadButton = $('[data-behavior="upload-avatar"]');
    ```

- Prefer to auto-bind in the constructor.

    ```es6
    // good
    class UserForm {
      constructor() {
        this.countrySelectEl = document.querySelector();

        this.handleClick = this.handleClick.bind(this);
      }

      bindEventListeners() {
        this.countrySelectEl.addEventListener('click', this.handleClick);
      }
    }
    ```

 - Prefer data-attribute selectors over classes or ids.

    ```es6
    // bad
    document.querySelector('.btn-upload');
    document.querySelector('#btn-upload');

    // good
    document.querySelector('[data-behavior="upload-avatar"]');
    ```
