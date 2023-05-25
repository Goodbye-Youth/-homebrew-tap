class Emqx < Formula
  desc "Emqx"
  homepage "https://github.com/Goodbye-Youth/homebrew-tap"
  url "https://github.com/Goodbye-Youth/homebrew-tap/releases/download/emqx-5.0.25/emqx-5.0.25-macos12-amd64.zip"
  sha256 "043a4b856965477e958bb115e8cd57c9d1efd7e3edf326b895c67ad70193a272"
  version "1.0.0"
  
  def install
    bin.install "bin["*"]"
  end
  
  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>KeepAlive</key>
          <dict>
            <key>SuccessfulExit</key>
            <false/>
          </dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/bin/emqx</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>WorkingDirectory</key>
          <string>#{var}</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/emqx.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/emqx.log</string>
        </dict>
      </plist>
    EOS
  end
end
