cask "pi-launcher" do
  version "1.2.21"
  sha256 "2085ae2edffb3bc5e9e69c8913de2d74d9b0c8b95cd9e79f1941b8e1c48bdca1"

  url "https://github.com/kunchenguid/pi-launcher/releases/download/v#{version}/Pi-Launcher-#{version}.zip"
  name "Pi Launcher"
  desc "Run the bundled Pi CLI under a stable, signed app identity"
  homepage "https://github.com/kunchenguid/pi-launcher"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Pi Launcher.app"
  binary "#{appdir}/Pi Launcher.app/Contents/MacOS/pi-launcher", target: "pi-signed"

  uninstall quit: "com.kunchenguid.pi-launcher"
end
