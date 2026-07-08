cask "transmission-remote-gui-macos" do
  version "0.1.3"
  sha256 "adce1eeaee93a5adb74eb5d39353453365bda456522d8d5860bd7d9c3c465768"

  url "https://github.com/epaxpax/transmission-remote-gui/releases/download/v#{version}/Transmission.Remote.GUI.app.zip",
      verified: "github.com/epaxpax/transmission-remote-gui/"
  name "Transmission Remote GUI"
  desc "Native SwiftUI macOS remote GUI for the Transmission BitTorrent daemon"
  homepage "https://github.com/epaxpax/transmission-remote-gui"

  app "Transmission Remote GUI.app"

  # Ad-hoc signed (not notarized): strip the download quarantine so Gatekeeper
  # does not block launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Transmission Remote GUI.app"]
  end

  caveats <<~EOS
    Transmission Remote GUI is ad-hoc signed (not notarized). If macOS still blocks it,
    right-click it in Applications and choose Open.
  EOS
end
