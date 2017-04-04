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
