cask "short-pipe" do
  version "0.0.4"
  sha256 "6604dc594bf94f316f9b24dd9b66c26ecf230bb9d28952e353ce10e2b18f94f8"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.4/Short-Pipe-0.0.4-universal.dmg"
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
