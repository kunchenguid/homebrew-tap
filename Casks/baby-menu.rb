cask "baby-menu" do
  version "0.1.6"
  sha256 "5d634684fba8417d34c01e2726b0bca188a69b6b01098f6c465ed5b0e92832f3"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.6/Baby-Menu-0.1.6-universal.dmg"
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
