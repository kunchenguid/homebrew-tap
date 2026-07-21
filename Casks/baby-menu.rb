cask "baby-menu" do
  version "0.1.20"
  sha256 "720187bf217deb83e62df8c907925fa1c21ebaf0696022582c7b7c7ef315a636"

  url "https://github.com/kunchenguid/baby-menu/releases/download/baby-menu-v0.1.20/Baby-Menu-0.1.20-universal.dmg"
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
