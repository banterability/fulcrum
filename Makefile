usage:
	@echo ''
	@echo 'Task            : Description'
	@echo '--------------  : --------------'
	@echo 'make build      : Compile client-side code'
	@echo ''

build:
	cjsify -r src index.coffee -x App -o app.js
