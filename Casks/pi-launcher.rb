cask "pi-launcher" do
  version "1.2.24"
  sha256 "02ca035f13c05031f3b34eb1956ca2e86430272374f818f1d4368ec3783bda66"

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
