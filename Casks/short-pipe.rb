cask "short-pipe" do
  version "0.0.6"
  sha256 "b8f835e940d3881e8ef73fa0f497a6d17497c406d7e49746811b43c49a80b3ee"

  url "https://github.com/kunchenguid/short-pipe/releases/download/short-pipe-v0.0.6/Short-Pipe-0.0.6-universal.dmg"
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
