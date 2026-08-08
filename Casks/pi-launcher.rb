cask "pi-launcher" do
  version "1.2.1"
  sha256 "b69782b78a71e038d3a67f349233811aa8f5d3f7a14079aad9e4f53093d93223"

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
