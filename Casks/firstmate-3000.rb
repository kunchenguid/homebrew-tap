cask "firstmate-3000" do
  version "0.1.6"
  sha256 "b0b89dbaf38c356ca95b45b0cac7373f9d6fd9c2134cfed5d14d23a47cf86e41"

  url "https://github.com/kunchenguid/homebrew-tap/releases/download/firstmate-3000-v0.1.6/Firstmate-3000-0.1.6-universal.zip"
  name "Firstmate 3000"
  desc "Calm desktop first officer that runs AI crew on your own subscriptions"
  homepage "https://github.com/kunchenguid/homebrew-tap"

  depends_on macos: :ventura

  app "Firstmate 3000.app"

  uninstall quit: "com.kunchenguid.firstmate3000"

  zap trash: [
    "~/Library/Application Support/firstmate-3000",
    "~/Library/Caches/com.kunchenguid.firstmate3000",
    "~/Library/Preferences/com.kunchenguid.firstmate3000.plist",
    "~/Library/Saved Application State/com.kunchenguid.firstmate3000.savedState",
  ]

  caveats <<~EOS
    Firstmate 3000 is in private alpha: a pre-release build for a small group
    of early users, provided as is, with no warranty and no promise that
    anything stays stable from one build to the next. It runs entirely on your
    Mac against the subscriptions you already pay for. The one thing it sends
    back is anonymous diagnostics: a fixed set of usage events - the app
    opening, a Firstmate turn finishing or failing, and how far first-time
    setup has come - each with the app version and a random install ID that is
    tied to nothing about you and resets whenever Diagnostics is turned off and
    back on, and never anything you typed, so Kun can see how many people use
    the alpha and where setup gets stuck; the app tells you on its first
    launch, and the Diagnostics switch in Settings turns it off. The source and
    its license follow at the public beta. Feedback is welcome on Kun's
    Discord: https://discord.gg/Wsy2NpnZDu
  EOS
end
