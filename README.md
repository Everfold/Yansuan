# Yansuan

***WIP***, still planning.

> *衍算/Yansuan*

## Build

```bash
# Dev Environment
nix develop

# Target
xmake f -p [linux|macos|windows] -a [x86_64|arm64] -m [debug|release]
## Clean Config
xmake f -c

# Build
xmake build -vD

# Run
xmake run

# Debug
xmake f -m debug
xmake run -d

# Test
xmake test -vD

# Format
xmake project -k compile_commands build
pre-commit install
pre-commit run --all-files
```

## Thanks

- [Embeddable Common-Lisp](https://gitlab.com/embeddable-common-lisp/ecl)
- [Xmake](https://xmake.io/)
- [LLVM](https://llvm.org/)
- [pre-commit](https://pre-commit.com/)
- [Nix](https://nixos.org/)
