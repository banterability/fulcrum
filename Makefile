usage:
	@echo ''
	@echo 'Task            : Description'
	@echo '--------------  : --------------'
	@echo 'make build      : Compile client-side code'
	@echo 'make watch      : Run build on client-side save'
	@echo ''

build:
	cjsify -r src index.coffee -x App -o app.js

watch:
	cjsify -w -r src index.coffee -x App -o app.js
