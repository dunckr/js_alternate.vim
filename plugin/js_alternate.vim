let g:js_alternate#src_types = ['lib', 'src', 'app', 'scripts', 'js']
let g:js_alternate#test_types = ['tests', 'test', 'spec']
let g:js_alternate#extensions_types = ['js', 'jsx']

function! js_alternate#alternate()
	let path = expand("%:r")
	let extension = expand("%:e")
	let alternatives = []
	if js_alternate#is_a_test(current_file)
		js_alternate#to_test(path, extension)
	else
		alternatives += js_alternate#to_src(path, extension)
	endif

	for alternative in alternatives
		if !empty(alternative)
			exec ':e ' . alternative
			break
		end
	endfor
endfunction

nnoremap <leader>t :call js_alternate#alternate()<cr>
