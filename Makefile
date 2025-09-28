.PHONY: init update validate

init:
\tgit submodule update --init --recursive

update:
\tgit submodule update --remote --recursive
\tgit add dotfiles || true
\tgit commit -m "Bump submodules" || true

validate:
\t@grep -E 'path = ' .gitmodules >/dev/null 2>&1 || { echo "No submodules found."; exit 0; }
\t@bad=0; \\
\twhile read -r path; do \\
\t  if ! echo "$$path" | grep -Eq '^dotfiles/[a-z0-9-]+(|/[a-z0-9]+-[a-z0-9]+(-[a-z0-9]+)?)$$'; then \\
\t    echo "Invalid submodule path: $$path"; bad=1; \\
\t  fi; \\
\tdone < <(grep -E 'path = ' .gitmodules | sed 's/.*path = //'); \\
\texit $$bad
