cask "short-pipe" do
  version "0.0.3"
  sha256 "23dfc3d2425986b55b8d66f7f5ce2c062462542170fc2fe5f3a354eaf1f4afdd"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.3/Short-Pipe-0.0.3-universal.dmg"
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
