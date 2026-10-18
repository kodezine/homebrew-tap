cask "rustybbd" do
  version "0.2.0"
  sha256 "48078205b5e682d2841658c2093478898f172bee616c514ca4e8e8b16028d9d6"

  url "https://kodezine.com/downloads/rustybbd/v0.2.0/rustybbd-v0.2.0-aarch64-apple-darwin.tar.gz"
  name "rustybbd"
  desc "CANopen bootloader firmware-update CLI (Summit / KCAN / Apex adapters)"
  homepage "https://kodezine.com/software/rustybbd.html"

  depends_on arch: :arm64
  depends_on :macos

  # The tarball unpacks to rustybbd-v<version>-aarch64-apple-darwin/rustybbd
  binary "rustybbd-v#{version}-aarch64-apple-darwin/rustybbd"

  # rustybbd is not notarized. Strip the quarantine flag Gatekeeper attaches to
  # downloaded binaries so the CLI runs without a "cannot be opened" dialog.
  preflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{staged_path}}"]
  end

  caveats <<~EOS
    rustybbd is not notarized with Apple. If macOS still blocks it, run:
      xattr -d com.apple.quarantine "$(brew --prefix)/bin/rustybbd"

    PEAK (Summit) adapters need the vendor PCANBasic driver (libPCBUSB):
      https://mac-can.com
    KCAN and Apex USB adapters work without additional drivers.

    Verify downloads with minisign against the Kodezine public key published at
      https://kodezine.com/software/rustybbd.html
  EOS
end
