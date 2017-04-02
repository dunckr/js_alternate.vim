function! js_alternate#alternatives(path)
	let alternatives = []
	if js_alternate#is_a_test(a:path)
		for extension in g:js_alternate#extension_types
			let alternatives += js_alternate#to_src(a:path, extension)
		endfor
	else
		for extension in g:js_alternate#extension_types
			let alternatives += js_alternate#to_test(a:path, extension)
		endfor
	endif
	return alternatives
endfunction

function! js_alternate#to_test(path, extension)
	let file_name = s:file_name(a:path)
	let path_full = a:path
	let path_without_root = s:path_excluding_root(a:path)
	let path_without_file_name = s:path_excluding_file_name(a:path)

	let extension = "." . a:extension
	let alternatives = []

	for type in g:js_alternate#test_types
		call add(alternatives, type . '/' . path_without_root . extension)
		call add(alternatives, path_without_file_name . '/__' . type . '__/' . file_name . extension)
		for extension_type in g:js_alternate#test_types
			call add(alternatives, path_full . '.' . extension_type . extension)
			call add(alternatives, type . '/' . path_without_root . '.' . extension_type . extension)
			call add(alternatives, path_without_file_name . '/__' . type . '__/' . file_name . '.' . extension_type . extension)
		endfor
	endfor
	return alternatives
endfunction


function! s:path_excluding_root(path)
endfunction

function! js_alternate#to_src(path, extension)
	let file_name = s:file_name(a:path)

	let path_without_file_name = s:path_excluding_file_name(a:path)
	let dir_split = split(path_without_file_name, '/')

	" remove file_name.test
	for type in g:js_alternate#test_types
		let file_name = substitute(file_name, '.' . type, '', '')
	endfor

	" remove last folder
	for type in g:js_alternate#test_types
		if dir_split[len(dir_split) - 1] == '__' . type . '__'
			call remove(dir_split, len(dir_split) - 1)
		endif
	endfor

	let extension = "." . a:extension
	let alternatives = []

	if index(g:js_alternate#test_types, dir_split[0]) != -1
		call remove(dir_split, 0)
		for type in g:js_alternate#src_types
			call add(alternatives, type . '/' . join(dir_split, '/') .  '/' . file_name . extension)
		endfor
	else
		call add(alternatives, join(dir_split, '/') .  '/' . file_name . extension)
	endif

	return alternatives
endfunction

function! js_alternate#is_a_test(path)
	return len(filter(copy(g:js_alternate#test_types), 'match(a:path, v:val) != -1')) > 0
endfunction

function! s:path_excluding_root(path)
	let split = split(a:path, '/')
	call remove(split, 0)
	return join(split, '/')
endfunction

function! s:file_name(path)
	return fnamemodify(a:path, ':t')
endfunction

function! s:path_excluding_file_name(path)
	return fnamemodify(a:path, ':h')
endfunction
