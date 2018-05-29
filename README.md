# vim-gitbranch
## Usage
This plugin provides a function which returns the name of the git branch.
```vim
:echo gitbranch#name()
```

You can use this function to integrate with statusline plugins.

For example, in order to show git branch using [lightline.vim](https://github.com/itchyny/lightline.vim), configure as follows.
```vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
```

Also useful is `gitbranch#icon_and_name`, which will return the branch name prepended with a customizable icon (`↳` by default). This function helps maximize compatibility with [lightline.vim](https://github.com/itchyny/lightline.vim) as `component_function` can be used (instead of `component`), which prevents separators from being drawn when the `component_function` is empty (*e.g.*, there is no git repository).

You can set a custom icon to be used in conjuction with `gitbranch#icon_and_name`:
```vim
let g:gitbranch_icon = '↝'
```

See the [README.md of lightline](https://github.com/itchyny/lightline.vim) for further details.

## Installation
Install with your favorite plugin manager.

## Author
itchyny (https://github.com/itchyny)

## License
This software is released under the MIT License, see LICENSE.
