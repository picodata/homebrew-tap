class GeninAT040 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.0-x86_64-macosx.tar.gz"
  sha256 "1171e809a891a68e53645b8774a8aa09248969485934fcb62ff8a85d8f7c7b89"
  version "0.4.0"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end