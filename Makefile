.PHONY: mac
mac:
	rash ./main.yml
.PHONY: bootstrap
bootstrap:
	comtrya -d dotfiles apply
.PHONY: private
private:
	comtrya -d private apply