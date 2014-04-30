usage:
	@echo ''
	@echo 'Task               : Description'
	@echo '--------------     : --------------'
	@echo 'make client        : Compile & package client JS'
	@echo 'make server        : Start server on port 5678'
	@echo 'make watch-client  : Recompile client JS on file change'
	@echo 'make watch-server  : Reload server on file change'
	@echo ''

.PHONY: client server watch-client watch-server

client:
	./node_modules/.bin/cjsify -r client index.coffee -x App -o app.js

server:
	./node_modules/.bin/coffee server/index.coffee

watch-client:
	./node_modules/.bin/cjsify -w -r client index.coffee -x App -o app.js

watch-server:
	./node_modules/.bin/node-dev server/index.coffee
