class NodeExporter < Formula
  desc "NodeExporter"
  homepage "https://github.com/Goodbye-Youth/homebrew-tap"
  url "https://github.com/Goodbye-Youth/homebrew-tap/releases/download/node_exporter-1.5.0/node_exporter-1.5.0.darwin-amd64.tar.gz"
  sha256 "aa87d2553f1b194cd883826ce19ee2700f4fe6a0bce4592b4c2884a3d2dc7cbb"
  version "1.0.0"
  
  def install
    bin.install "node_exporter"
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
            <string>#{opt_bin}/node_exporter</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>WorkingDirectory</key>
          <string>#{var}</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/node_exporter.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/node_exporter.log</string>
        </dict>
      </plist>
    EOS
  end
end
