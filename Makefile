.PHONY: link
link:
	./scripts/link.sh all
.PHONY: unlink
unlink:
	./scripts/unlink.sh
.PHONY: temp-env
temp-env:
	./scripts/import_temp_env.sh
.PHONY: ssrestart
ssrestart:
	systemctl --user restart ss
.PHONY: pull
pull:
	cd private && git pull && cd ../ && git pull
.PHONY: push

.PHONY: caddyrestart
caddyrestart:
	sudo systemctl restart caddy
.PHONY: slogs
slogs:
	sudo journalctl -f
.PHONY: backup
backup:
	./modules/qBittorrent/backup_qBittorrent_config.sh
