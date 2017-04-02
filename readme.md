# js_alternate.vim [![Build Status](https://travis-ci.org/dunckr/js_alternate.vim.svg?branch=master)](https://travis-ci.org/dunckr/js_alternate.vim)

Easy navigation of a JavaScript directory structure. Inspired by the amazing [vim-rails(https://github.com/tpope/vim-rails).

There is one command, `:js_alternate#run` (alternate) for easy jumping between a JavaScript source file and it’s corresponding test.

## Installation

Use your favourite plugin manager.

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'dunckr/js_alternate.vim', { 'for': ['javascript', 'javascript.jsx'] }
```

## Usage

```vim
nnoremap <leader>t :call js_alternate#run()<cr>
```

## License

MIT © [Duncan Beaton](http://dunckr.com)
