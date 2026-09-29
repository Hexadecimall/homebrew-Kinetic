# Kinetic Homebrew tap

Apple Silicon, macOS 15 or newer. Requires Apple Command Line Tools and an existing Rust toolchain (Cargo). Install Rust with rustup if needed.

```sh
brew install --formula Hexadecimall/Kinetic/kinetic
open "$(brew --prefix kinetic)/Kinetic.app"
```

Kinetic builds locally from checksum-pinned source. CMake is a build-only dependency. No LLVM toolchain or language servers are bundled or added as formula dependencies. Language tools remain separate, optional downloads.

For an existing binary cask installation, first run `brew uninstall --cask kinetic`. Settings and downloaded tools in `~/.kinetic/` are preserved. The binary cask is disabled.

Update with `brew upgrade --formula Hexadecimall/Kinetic/kinetic`.
