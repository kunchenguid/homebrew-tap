cask "firstmate-3000" do
  version "0.5.1"
  sha256 "ab60df00dd706e13b491017f19ef1e730f823e11e2f799dd70832cf045365781"

  url "https://github.com/kunchenguid/homebrew-tap/releases/download/firstmate-3000-v#{version}/Infinitary-#{version}-universal.zip"
  name "Infinitary"
  desc "Calm desktop first mate that runs AI crew on your own subscriptions"
  homepage "https://github.com/infinitary-labs/homebrew-tap"

  conflicts_with cask: "firstmate-3000@alpha"
  depends_on macos: :ventura

  app "Infinitary.app"

  if defined?(Homebrew::InstallSteps::DSL) && Homebrew::InstallSteps::DSL.method_defined?(:write_file)
    postflight_steps do
      write_file "Library/Application Support/infinitary/update-channel.json",
                 "{\"schemaVersion\":1,\"channel\":\"stable\",\"cameThroughOldCask\":true}\n",
                 base: :home
    end
  else
    postflight do
      marker = File.expand_path("~/Library/Application Support/infinitary/update-channel.json")
      FileUtils.mkdir_p File.dirname(marker)
      File.write marker, "{\"schemaVersion\":1,\"channel\":\"stable\",\"cameThroughOldCask\":true}\n"
    end
  end

  uninstall quit: "com.getinfinitary.infinitary"

  zap trash: [
    "~/Library/Application Support/infinitary",
    "~/Library/Caches/com.getinfinitary.infinitary",
    "~/Library/Preferences/com.getinfinitary.infinitary.plist",
    "~/Library/Saved Application State/com.getinfinitary.infinitary.savedState",
  ]

  caveats <<~EOS
    Infinitary is in private alpha: a pre-release build for a small group of
    early users, provided as is, with no warranty and no promise that anything
    stays stable from one build to the next. It runs entirely on your Mac
    against the subscriptions you already pay for. The one thing it sends back
    is anonymous diagnostics: a fixed set of usage events - the app opening, a
    first mate turn finishing or failing, and how far first-time setup has come
    - each with the app version and a random install ID that is tied to nothing
    about you and resets whenever Diagnostics is turned off and back on, and
    never anything you typed, so Kun can see how many people use the alpha and
    where setup gets stuck; the app tells you on its first launch, and the
    Diagnostics switch in Settings turns it off. The source and its license
    follow at the public beta. Feedback is welcome on Kun's Discord:
    https://discord.gg/Wsy2NpnZDu

    This is the stable channel. To get new versions sooner, with lighter
    checks, switch to the alpha channel; your saved work stays in place:

      brew uninstall --cask firstmate-3000
      brew install --cask kunchenguid/tap/firstmate-3000@alpha

    Never add --zap when switching: it deletes your saved work.
  EOS
end
