cask "hi-bit" do
  version "0.0.3"
  sha256 "033f079bc8383574fdabbc6fa2718a3874c7dc12e9384a2d606dc106c06d8082"

  url "https://github.com/kunchenguid/hi-bit/releases/download/hi-bit-v0.0.3/Hi-Bit-0.0.3-universal.dmg"
  name "Hi-Bit"
  desc "Local-first app where kids build web projects with Bit"
  homepage "https://github.com/kunchenguid/hi-bit"

  depends_on macos: ">= :ventura"

  app "Hi-Bit.app"
  uninstall quit: "com.hibit.app"

  uninstall_preflight do
    next unless system("/usr/bin/pgrep", "-x", "Hi-Bit", out: File::NULL, err: File::NULL)

    system_command "/usr/bin/nohup", args: ["/bin/sh", "-c", <<~RELAUNCH_SCRIPT], must_succeed: false
      (
        while [ -e "#{appdir}/Hi-Bit.app" ]; do
          /bin/sleep 1
        done

        for _ in $(/usr/bin/seq 1 60); do
          if [ -x "#{appdir}/Hi-Bit.app/Contents/MacOS/Hi-Bit" ]; then
            /usr/bin/open -a "#{appdir}/Hi-Bit.app"
            exit 0
          fi
          /bin/sleep 1
        done
      ) >/dev/null 2>&1 &
    RELAUNCH_SCRIPT
  end

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Hi-Bit.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/hi-bit",
    "~/Library/Preferences/com.hibit.app.plist",
  ]
end
