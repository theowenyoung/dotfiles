ifneq (,$(wildcard ~/.config/meilisearch/.env))
    include ~/.config/meilisearch/.env
    export
endif
.PHONY: start
start:
	cd ~/.config/meilisearch && ~/.local/bin/meilisearch

