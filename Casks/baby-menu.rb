cask "baby-menu" do
  version "0.1.0"
  sha256 "f24a4919f915c0e0ebfbbb43b3d5f989d9b2b56ccaf45c3f6267785c5155940e"

  url "https://github.com/kunchenguid/baby-menu/releases/download/v#{version}/Baby-Menu-#{version}-universal.dmg"
  name "Baby Menu"
  desc "Menu-bar app that writes its own widgets"
  homepage "https://github.com/kunchenguid/baby-menu"

  depends_on macos: ">= :ventura"

  app "Baby Menu.app"

  uninstall quit: "com.kunchenguid.baby-menu"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Baby Menu.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/.baby-menu",
    "~/Library/Preferences/com.kunchenguid.baby-menu.plist",
  ]
end
