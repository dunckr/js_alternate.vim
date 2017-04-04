# js_alternate.vim [![Build Status](https://travis-ci.org/dunckr/js_alternate.vim.svg?branch=master)](https://travis-ci.org/dunckr/js_alternate.vim)

Easy navigation of a JavaScript directory structure. Inspired by the amazing [vim-rails](https://github.com/tpope/vim-rails).

![](https://raw.githubusercontent.com/dunckr/imgs/master/js_alternate.gif)

There is one command, `:A` (alternate) for easy jumping between a JavaScript source file and it’s corresponding test.

## Installation

Use your favourite plugin manager.

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'dunckr/js_alternate.vim'
```

## Usage

```vim
" Switch between JavaScript source and it's test file
:A

" Mapping to <leader>t
nnoremap <leader>t :call js_alternate#run()<cr>
```

## Extend

```vim
let g:js_alternate#src_types = ['lib', 'src', 'app', 'scripts', 'js', 'javascript', 'frontend']
let g:js_alternate#test_types = ['tests', 'test', 'spec', 'features']
let g:js_alternate#extension_types = ['js', 'jsx', 'coffee', 'ts', 'elm', 'purs']
```

## License

MIT © [Duncan Beaton](http://dunckr.com)
