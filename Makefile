.PHONY: link
link:
	~/.local/bin/comtrya -d modules apply && ~/.local/bin/comtrya -d private apply
.PHONY: public
public:
	comtrya -d modules apply
.PHONY: private
private:
	comtrya -d private apply
.PHONY: restart
restart:
	systemctl --user restart ss
.PHONY: sync
sync:
	cd private && git pull && cd ../ && git pull