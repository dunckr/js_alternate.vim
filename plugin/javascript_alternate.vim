function! javascript_alternate#run()
	let path = expand("%:r")
	let alternatives = javascript_alternate#alternatives(path)
	for alternative in alternatives
		if filereadable(alternative)
			exec ':e ' . alternative
			break
		end
	endfor
endfunction

command! A call javascript_alternate#run()
