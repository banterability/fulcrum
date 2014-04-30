usage:
	@echo ''
	@echo 'Task            : Description'
	@echo '--------------  : --------------'
	@echo 'make build      : Compile client-side code'
	@echo 'make watch      : Run build on client-side save'
	@echo 'make dev-server : Start live-reloading app server'
	@echo 'make server     : Build client-side assets and start server on port 5678'
	@echo ''

.PHONY: dev-server

build:
	./node_modules/.bin/cjsify -r src index.coffee -x App -o app.js

watch:
	./node_modules/.bin/cjsify -w -r src index.coffee -x App -o app.js

dev-server:
	./node_modules/.bin/node-dev server/index.coffee

server: build
	./node_modules/.bin/coffee server/index.coffee
