cask "short-pipe" do
  version "0.0.7"
  sha256 "91cabc2708d90923cbee72dd4da91654c82a8c8f794491c38f2905bdc64ad49d"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.7/Short-Pipe-0.0.7-universal.dmg"
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
