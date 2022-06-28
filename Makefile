.PHONY: link
link:
	comtrya -d dotfiles apply && comtrya -d private apply
.PHONY: dotfiles
dotfiles:
	comtrya -d dotfiles apply
.PHONY: private
private:
	comtrya -d private apply