### JavaScript

In additional to the following guidelines, please also install and use [Prettier](https://github.com/prettier/prettier) with your favorite text editor.

##### Prettier Setup

*Atom*
1. Install the [`prettier-atom`](https://atom.io/packages/prettier-atom) package.
1. Configure the settings with the following defaults (added to `~/.atom/config.cson`).

  ```cson
  "prettier-atom":
    formatOnSaveOptions:
      enabled: true
      showInStatusBar: true
    prettierOptions:
      parser: "flow"
      singleQuote: true
   ```

##### General
- Prefer `const` and `let` over `var`.
- Prefer to exclude jQuery from new projects.
