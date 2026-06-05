cask "short-pipe" do
  version "0.0.2"
  sha256 "8c83fbb9d05199a3f51f50ef5e1b80cee8800e443444cbe04c3d72cea7e9c932"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.2/Short-Pipe-0.0.2-universal.dmg"
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
