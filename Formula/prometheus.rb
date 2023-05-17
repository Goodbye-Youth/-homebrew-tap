class Prometheus < Formula
  desc "Prometheus"
  homepage "https://github.com/Goodbye-Youth/homebrew-tap"
  url "https://github.com/Goodbye-Youth/homebrew-tap/releases/download/prometheus-2.44.0/prometheus-2.44.0.darwin-amd64.tar.gz"
  sha256 "05b100f105cbb664e99d12361cbc938318ee99a1f8c4d5b9c7dbbfd2c07923c3"
  version "1.0.0"
  
  def install
    bin.install "prometheus"
    etc.install "prometheus.yml"
  end
end
