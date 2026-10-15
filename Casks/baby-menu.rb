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

  uninstall_preflight do
    next unless system("/usr/bin/pgrep", "-x", "Baby Menu", out: File::NULL, err: File::NULL)

    system_command "/usr/bin/nohup", args: ["/bin/sh", "-c", <<~RELAUNCH_SCRIPT], must_succeed: false
      (
        while [ -e "#{appdir}/Baby Menu.app" ]; do
          /bin/sleep 1
        done

        for _ in $(/usr/bin/seq 1 60); do
          if [ -x "#{appdir}/Baby Menu.app/Contents/MacOS/Baby Menu" ]; then
            /usr/bin/open -a "#{appdir}/Baby Menu.app"
            exit 0
          fi
          /bin/sleep 1
        done
      ) >/dev/null 2>&1 &
    RELAUNCH_SCRIPT
  end

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
