# graphics

Lug Nuts Club — Ricing, dotfiles, graphics repository.

This repository aggregates **club members' dotfiles** via [Git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Each member keeps ownership of their own upstream repo — this root repo just points to them.

---

## 📂 Structure
```bash
graphics/
├─ README.md
├─ MANIFEST.yml
├─ Makefile
├─ .gitignore
└─ dotfiles/
   └─ <handle>/ # submodule → https://github.com/<handle>/dotfiles
```

## 🚀 Quick Start

Clone with submodules:

```bash
git clone --recurse-submodules https://github.com/uta-lug-nuts/graphics.git
cd graphics
make init

# Update all submodules from latest 
make update

# Validate dotfiles/ricing repository and submodule paths:
make validate
```

---

## 🤝 Contributing
Fork this repository and clone it with submodules.

Add your dotfiles (create/or build a dotfiles/ricing repository) repository as a submodule:
```bash
git submodule add -b main https://github.com/<handle>/dotfiles dotfiles/<handle>
git config -f .gitmodules submodule.dotfiles/<handle>.branch main
git commit -m "Add <handle>'s dotfiles"
```

Update MANIFEST.yml with your entry:
```yaml
- handle: <handle>
  url: https://github.com/<handle>/dotfiles
  path: dotfiles/<handle>
  # Below is a wip
  #os: arch
  #wm: i3
  #tags: [tiling, terminal]
```

Push to your repository fork/branch and open a PR to the club repo.

---







