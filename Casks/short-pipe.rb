cask "short-pipe" do
  version "0.0.8"
  sha256 "3add42591cd179923737bc65f2f54ef92302fc9d4745405964cf8100db0eb873"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.8/Short-Pipe-0.0.8-universal.dmg"
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
