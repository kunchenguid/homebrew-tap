cask "baby-menu" do
  version "0.1.21"
  sha256 "f14fa2065a9b1a0ea3c8cc019930051cd82c6fb68db7ff2cc888889c08dec7f6"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.21/Baby-Menu-0.1.21-universal.dmg"
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
