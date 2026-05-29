cask "baby-menu" do
  version "0.1.5"
  sha256 "d29c982cae54a609c32ddec388e561938c2e7ffe6cf589ed482e4e7b5f75f6af"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.5/Baby-Menu-0.1.5-universal.dmg"
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
