cask "short-pipe" do
  version "0.0.10"
  sha256 "86c4ed5ffc6e68643576ec889bbfda0b0ca267ec6714e63f49afb6032b2b0128"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.10/Short-Pipe-0.0.10-universal.dmg"
  name "Short Pipe"
  desc "Turn long-form video into captioned vertical shorts, locally"
  homepage "https://github.com/kunchenguid/short-pipe"

  depends_on macos: :ventura

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
