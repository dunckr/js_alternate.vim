VIM = vim -N -u NORC -i NONE --cmd 'set rtp+=tests/vader rtp+=$$PWD'

test: testsetup
	$(VIM) '+Vader! tests/*.vader'

testnvim: testsetup
	VADER_OUTPUT_FILE=/dev/stderr n$(VIM) --headless '+Vader! tests/*.vader'

testinteractive: testsetup
	$(VIM) '+Vader tests/*.vader'

testsetup:
	git clone https://github.com/junegunn/vader.vim tests/vader || ( cd tests/vader && git pull --rebase; )

# watchman-make -p 'plugin/*' 'tests/*' --make='make testnvim' -t plugin/javascript-switch.vim

.PHONY: test testnvim testinteractive testsetup
