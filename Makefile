VIM = vim -N -u NORC -Nu support/vimrc -i NONE --cmd 'set rtp+=tests/vader rtp+=$$PWD'

test: testsetup
	$(VIM) '+Vader! tests/*.vader'

testnvim: testsetup
	VADER_OUTPUT_FILE=/dev/stderr n$(VIM) --headless '+Vader! tests/*.vader'

testinteractive: testsetup
	$(VIM) '+Vader tests/*.vader'

testsetup:
	git clone https://github.com/junegunn/vader.vim tests/vader || ( cd tests/vader && git pull --rebase; )

.PHONY: test testnvim testinteractive testsetup
