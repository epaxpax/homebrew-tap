cask "transmission-remote-gui-macos" do
  version "0.1.4"
  sha256 "12b3536e3c473f8c116308153fdb0f7d6f910af8a53f7115c0a090bce41fb3ed"

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
