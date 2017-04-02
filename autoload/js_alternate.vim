if exists("g:loaded_js_alternate")
  finish
endif
let g:loaded_js_alternate = 1

function! js_alternate#to_test(path, extension)
	let file_name = s:file_name(a:path)
	let path_full = a:path
	let path_without_root = s:path_excluding_root(a:path)
	let path_without_file_name = s:path_excluding_file_name(a:path)

	let extension = "." . a:extension
	let alternatives = []

	for option in g:test_types
		call add(alternatives, path_full . '.' . option . extension)
		call add(alternatives, option . '/' . path_without_root . extension)
		call add(alternatives, option . '/' . path_without_root . '.' . option . extension)
		call add(alternatives, path_without_file_name . '/__' . option . '__/' . file_name . extension)
		call add(alternatives, path_without_file_name . '/__' . option . '__/' . file_name . '.' . option . extension)
	endfor
	return alternatives
endfunction

function! js_alternate#to_src(path, extension)
	let file_name = s:file_name(a:path)

	let path_without_file_name = s:path_excluding_file_name(a:path)
	let dir_split = split(path_without_file_name, '/')

	" remove file_name.test
	for option in g:test_types
		let file_name = substitute(file_name, '.' . option, '', '')
	endfor

	" remove last folder
	for option in g:test_types
		if dir_split[len(dir_split) - 1] == '__' . option . '__'
			call remove(dir_split, len(dir_split) - 1)
		endif
	endfor

	let extension = "." . a:extension
	let alternatives = []

	if index(g:test_types, dir_split[0]) != -1
		call remove(dir_split, 0)
		for option in g:src_types
			call add(alternatives, option . '/' . join(dir_split, '/') .  '/' . file_name . extension)
		endfor
	else
		call add(alternatives, join(dir_split, '/') .  '/' . file_name . extension)
	endif

	return alternatives
endfunction

function! js_alternate#is_a_test(file)
	" TODO use test_types
	return match(a:file, 'test') != -1 ||
				\match(a:file, 'tests') != -1 ||
				\match(a:file, 'spec') != -1
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
