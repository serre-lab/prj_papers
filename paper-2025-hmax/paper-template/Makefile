.PHONY: pdf clean check publish

pdf:
	@./scripts/compile.sh

clean:
	@rm -rf build/

check:
	@./scripts/check_naming.sh

publish:
	@make pdf
	@make check
	@./scripts/publish.sh

