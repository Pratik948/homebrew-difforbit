cask "difforbit" do
  version "0.1.0"

  on_arm do
    url "https://github.com/Pratik948/difforbit/releases/download/v#{version}/DiffOrbit_#{version}_aarch64.dmg"
    sha256 "REPLACE_WITH_ARM64_SHA256"
  end

  on_intel do
    url "https://github.com/Pratik948/difforbit/releases/download/v#{version}/DiffOrbit_#{version}_x64.dmg"
    sha256 "REPLACE_WITH_X64_SHA256"
  end

  name "DiffOrbit"
  desc "AI-powered PR code review desktop app for macOS"
  homepage "https://github.com/Pratik948/difforbit"

  app "DiffOrbit.app"

  # Clear the quarantine attribute — required because DiffOrbit is not
  # notarised with an Apple certificate. Without this, macOS reports the
  # app as "damaged" even though it is perfectly safe.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-c", "#{appdir}/DiffOrbit.app"],
                   sudo: false
  end

  uninstall quit: "com.difforbit.app"

  zap trash: [
    "~/Library/Application Support/DiffOrbit",
    "~/Library/Logs/DiffOrbit",
    "~/Library/LaunchAgents/com.difforbit.app.plist",
    "~/Library/Preferences/com.difforbit.app.plist",
  ]
end
