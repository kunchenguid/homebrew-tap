cask "baby-menu" do
  version "0.1.4"
  sha256 "496574ef21146afdb253b41fe1f85dca5b0485257c4386c81fac8b8eb82af487"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.4/Baby-Menu-0.1.4-universal.dmg"
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
