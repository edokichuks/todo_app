auto_generate:
	dart run build_runner build --delete-conflicting-outputs 
build_apk_s:
	flutter build apk --split-per-abi

format: ## Formats the code
	@echo "╠ Formatting the code"
	@dart format lib .
	@flutter pub run import_sorter:main
	@dart fix --apply