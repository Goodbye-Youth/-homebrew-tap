class Prometheus < Formula
  desc "Prometheus"
  homepage "https://github.com/Goodbye-Youth/homebrew-tap"
  url "https://github.com/Goodbye-Youth/homebrew-tap/releases/download/prometheus-2.44.0/prometheus-2.44.0.darwin-amd64.tar.gz"
  sha256 "05b100f105cbb664e99d12361cbc938318ee99a1f8c4d5b9c7dbbfd2c07923c3"
  version "1.0.0"
  
  def install
    bin.install "prometheus", "promtool"
    etc.install "prometheus.yml"
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
            <string>#{opt_bin}/prometheus</string>
            <string>--config.file</string>
            <string>#{etc}/prometheus/prometheus.yml</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>WorkingDirectory</key>
          <string>#{var}</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/prometheus.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/prometheus.log</string>
        </dict>
      </plist>
    EOS
  end
end
