.PHONY: init update validate

init:
	@echo "[INFO] Initializing submodules..."
	@git submodule update --init --recursive
	@echo "[OK] Submodules initialized."

update:
	@echo "[INFO] Updating submodules to latest remote..."
	@git submodule update --remote --recursive
	@git add dotfiles || true
	@git commit -m "Bump submodules" || true
	@echo "[OK] Submodules updated and commit recorded."

validate:
	@echo "[INFO] Validating submodule paths..."
	@if ! grep -qE 'path = ' .gitmodules 2>/dev/null; then \
	  echo "[INFO] No submodules found. Nothing to validate."; \
	  exit 0; \
	fi; \
	bad=0; \
	for path in $$(grep -E 'path = ' .gitmodules | sed 's/.*path = //'); do \
	  if echo "$$path" | grep -Eq '^dotfiles/[a-z0-9-]+(|/[a-z0-9]+-[a-z0-9]+(-[a-z0-9]+)?)$$'; then \
	    echo "[OK] $$path is valid."; \
	  else \
	    echo "[ERROR] Invalid submodule path: $$path"; \
	    bad=1; \
	  fi; \
	done; \
	exit $$bad
