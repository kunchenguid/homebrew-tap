cask "firstmate-3000@alpha" do
  version "0.1.31"
  sha256 "ff29db43b45347d6ec8e9f31ee79205970c15c5f7cef0f33380f03a1135e6380"

  url "https://github.com/kunchenguid/homebrew-tap/releases/download/firstmate-3000-v#{version}/Firstmate-3000-#{version}-universal.zip"
  name "Firstmate 3000 Alpha"
  desc "Calm desktop first officer that runs AI crew on your own subscriptions"
  homepage "https://github.com/kunchenguid/homebrew-tap"

  conflicts_with cask: "firstmate-3000"
  depends_on macos: :ventura

  app "Firstmate 3000.app"

  if defined?(Homebrew::InstallSteps::DSL) && Homebrew::InstallSteps::DSL.method_defined?(:write_file)
    postflight_steps do
      write_file "Library/Application Support/firstmate-3000/update-channel.json",
                 "{\"schemaVersion\":1,\"channel\":\"alpha\"}\n",
                 base: :home
    end
  else
    postflight do
      marker = File.expand_path("~/Library/Application Support/firstmate-3000/update-channel.json")
      FileUtils.mkdir_p File.dirname(marker)
      File.write marker, "{\"schemaVersion\":1,\"channel\":\"alpha\"}\n"
    end
  end

  uninstall quit: "com.kunchenguid.firstmate3000"

  zap trash: [
    "~/Library/Application Support/firstmate-3000",
    "~/Library/Caches/com.kunchenguid.firstmate3000",
    "~/Library/Preferences/com.kunchenguid.firstmate3000.plist",
    "~/Library/Saved Application State/com.kunchenguid.firstmate3000.savedState",
  ]

  caveats <<~EOS
    Firstmate 3000 is in private alpha: a pre-release build for a small group of
    early users, provided as is, with no warranty and no promise that anything
    stays stable from one build to the next. It runs entirely on your Mac
    against the subscriptions you already pay for. The one thing it sends back
    is anonymous diagnostics: a fixed set of usage events - the app opening, a
    Firstmate turn finishing or failing, and how far first-time setup has come -
    each with the app version and a random install ID that is tied to nothing
    about you and resets whenever Diagnostics is turned off and back on, and
    never anything you typed, so Kun can see how many people use the alpha and
    where setup gets stuck; the app tells you on its first launch, and the
    Diagnostics switch in Settings turns it off. The source and its license
    follow at the public beta. Feedback is welcome on Kun's Discord:
    https://discord.gg/Wsy2NpnZDu

    This is the alpha channel: new versions sooner, with lighter checks,
    and every newer stable version too. To return to the stable channel,
    keeping your saved work in place:

      brew uninstall --cask firstmate-3000@alpha
      brew install --cask kunchenguid/tap/firstmate-3000

    If that stable version cannot open work saved by a newer alpha, it says
    so and changes nothing; reinstall the alpha or wait for the next stable.
    Never add --zap when switching: it deletes your saved work.
  EOS
end
