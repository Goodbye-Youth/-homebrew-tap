class mysqld_exporter < Formula
  desc "mysqld_exporter"
  homepage "https://github.com/Goodbye-Youth/homebrew-tap"
  url "https://github.com/Goodbye-Youth/homebrew-tap/releases/download/mysqld_exporter-0.15.0-rc.0/mysqld_exporter-0.15.0-rc.0.darwin-amd64.tar.gz"
  sha256 "9bbb4d9bb6ae1d58939f589d1ca75b198158609d0c9e357a2b02a7bd3f5f73b2"
  version "1.0.0"
  
  def install
    bin.install "mysqld_exporter"
    (buildpath/".my.cnf").write
    <<~EOS
		[client]
		user=exporter
		password=exporter
	EOS
    etc.install ".my.cnf"
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
            <string>#{opt_bin}/mysqld_exporter</string>
            <string>---config.my-cnf</string>
            <string>#{etc}/.my.cnf</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>WorkingDirectory</key>
          <string>#{var}</string>
          <key>StandardErrorPath</key>
          <string>#{var}/log/mysqld_exporter.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/mysqld_exporter.log</string>
        </dict>
      </plist>
    EOS
  end