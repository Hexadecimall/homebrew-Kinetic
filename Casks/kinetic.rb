cask "kinetic" do
  version "0.31.1"
  sha256 "a557059d072bde4bc67a14eaf50987b876a117e7a6e2daa339aaea770e26af53"

  url "https://github.com/Hexadecimall/Kinetic/releases/download/v#{version}/Kinetic-#{version}-macos-arm64.zip"
  name "Kinetic"
  desc "Code editor with Rust and C++ plugin support"
  homepage "https://github.com/Hexadecimall/Kinetic"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Kinetic.app"
  binary "#{appdir}/Kinetic.app/Contents/Resources/bin/kinetic"

  preflight_steps do
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{staged_path}}/Kinetic.app"]
    run "/usr/bin/codesign",
        args: ["--force", "--sign", "-", "{{staged_path}}/Kinetic.app/Contents/PlugIns/libkineticCppSupport.dylib"]
    run "/usr/bin/codesign",
        args: ["--force", "--sign", "-", "{{staged_path}}/Kinetic.app/Contents/Resources/bin/kinetic"]
    run "/usr/bin/codesign",
        args: ["--force", "--sign", "-", "{{staged_path}}/Kinetic.app"]
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{staged_path}}/Kinetic.app"]
  end

  postflight_steps do
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{appdir}}/Kinetic.app"]
  end

  caveats "Locally ad-hoc signed; not notarized. macOS may block first launch."
end
