.PHONY: link
link:
	./scripts/link_all.sh
.PHONY: unlink
unlink:
	./scripts/unlink.sh
.PHONY: temp-env
temp-env:
	./scripts/import_temp_env.sh
.PHONY: ssrestart
ssrestart:
	systemctl --user restart ss
.PHONY: sync
sync:
	cd private && git pull && cd ../ && git pull
.PHONY: caddyrestart
caddyrestart:
	sudo systemctl restart caddy
.PHONY: slogs
slogs:
	sudo journalctl -f