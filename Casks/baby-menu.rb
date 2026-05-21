cask "baby-menu" do
  version "0.1.1"
  sha256 "b411ab6d6f8070a828b25fddac1d0e49978faa28979fe1614dd4e032531637b8"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.1/Baby-Menu-0.1.1-universal.dmg"
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
