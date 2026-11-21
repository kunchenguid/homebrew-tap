cask "pi-launcher" do
  version "1.2.22"
  sha256 "d651ede6f67a0f87c833a6f7577568190aeaa0ee88a6a98904b77595fe77c426"

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
