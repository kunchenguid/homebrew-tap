cask "baby-menu" do
  version "0.1.2"
  sha256 "ad4b84e6d5178395bc1c40d9199180b684d904944f57d1fb3fb707b9e7becc52"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.2/Baby-Menu-0.1.2-universal.dmg"
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
