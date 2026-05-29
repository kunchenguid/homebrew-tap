cask "baby-menu" do
  version "0.1.7"
  sha256 "7d4bdd01aac6a32bb8b294ac78fddf0835a2d7c0530c26b393d363d6d2a53f51"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.7/Baby-Menu-0.1.7-universal.dmg"
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
