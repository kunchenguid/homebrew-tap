cask "short-pipe" do
  version "0.0.5"
  sha256 "c69802b43994ce313c248ca0740f83ca00a1b29368d4fc95be5132518cc17332"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.5/Short-Pipe-0.0.5-universal.dmg"
  name "Short Pipe"
  desc "Turn long-form video into captioned vertical shorts, locally"
  homepage "https://github.com/kunchenguid/short-pipe"

  depends_on macos: ">= :ventura"

  app "Short Pipe.app"
  uninstall quit: "com.shortpipe.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Short Pipe.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/.short-pipe",
    "~/Library/Application Support/Short Pipe",
    "~/Library/Preferences/com.shortpipe.app.plist",
    "~/Library/Saved Application State/com.shortpipe.app.savedState",
  ]
end
