usage:
	@echo ''
	@echo 'Task            : Description'
	@echo '--------------  : --------------'
	@echo 'make build      : Compile client-side code'
	@echo 'make watch      : Run build on client-side save'
	@echo ''

build:
	./node_modules/.bin/cjsify -r src index.coffee -x App -o app.js

watch:
	./node_modules/.bin/cjsify -w -r src index.coffee -x App -o app.js
