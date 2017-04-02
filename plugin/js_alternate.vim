let g:js_alternate#src_types = ['lib', 'src', 'app', 'scripts', 'js']
let g:js_alternate#test_types = ['tests', 'test', 'spec']
let g:js_alternate#extension_types = ['js', 'jsx']

function! js_alternate#run()
	let path = expand("%:r")
	let alternatives = js_alternate#alternatives(path)
	for alternative in alternatives
		if filereadable(alternative)
			exec ':e ' . alternative
			break
		end
	endfor
endfunction

nnoremap <leader>t :call js_alternate#run()<cr>
