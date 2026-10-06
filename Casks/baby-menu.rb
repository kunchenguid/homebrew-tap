cask "baby-menu" do
  version "0.1.24"
  sha256 "0e419ca4b4044e6b3b44b6eaa579cbe89256dc64ec5e6b32f21ff03513659bdd"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.24/Baby-Menu-0.1.24-universal.dmg"
  name "Baby Menu"
  desc "Menu-bar app that writes its own widgets"
  homepage "https://github.com/kunchenguid/baby-menu"

  depends_on macos: :ventura

  app "Baby Menu.app"
  uninstall quit: "com.kunchenguid.baby-menu"

  # The old uninstall_preflight relaunch waited for the app bundle to be
  # replaced and then opened it. Structured steps cannot launch apps, so that
  # relaunch is not carried over. Quit still happens through uninstall.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/Baby Menu.app"],
        must_succeed: false
  end

  zap trash: [
    "~/.baby-menu",
    "~/Library/Preferences/com.kunchenguid.baby-menu.plist",
  ]
end
