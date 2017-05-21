# js_alternate.vim [![Build Status](https://travis-ci.org/dunckr/js_alternate.vim.svg?branch=master)](https://travis-ci.org/dunckr/js_alternate.vim)

Easy navigation between JavaScript alternate files (source and test). Inspired by the amazing [vim-rails](https://github.com/tpope/vim-rails).

![](https://raw.githubusercontent.com/dunckr/imgs/master/js_alternate.gif)

There is one command, `:A` (alternate) for easy jumping between a JavaScript source file and it’s corresponding test.

Looks for a variety to different test file paths including:

* Root level folders e.g. `tests/component/example.js, test/component/example.js, spec/component/example.js`
* Sub-folder level folders e.g. `src/component/__tests__/example.js`
* Suffixed extensions e.g. `example.tests.js, example.test.js, example.spec.js`
* Underscored folders e.g. `src/component/__tests__/example.js, src/component/__test__/example.js, src/component/__spec__/example.js`
* Differences of file types between source and tests files e.g. `example.js, example.jsx`

For a full list of paths checked against see the [tests](https://github.com/dunckr/js_alternate.vim/blob/master/tests/alternatives.vader).

## Installation

Use your favourite plugin manager.

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'dunckr/js_alternate.vim'
```

## Usage

```vim
:A " Switches between JavaScript source and it's test file

" Mapping of js_alternate#run to <leader>t
nnoremap <leader>t :call js_alternate#run()<cr>
```

## Extend

```vim
" The source folder names used to construct the source file paths:
let g:js_alternate#src_types = ['lib', 'src', 'app', 'scripts', 'js', 'javascript', 'frontend']

" The test names used to construct the test file paths:
let g:js_alternate#test_types = ['tests', 'test', 'spec', 'features']

" The extension name types used to look for:
let g:js_alternate#extension_types = ['js', 'jsx', 'coffee', 'ts', 'elm', 'purs']
```

## License

MIT © [Duncan Beaton](http://dunckr.com)
