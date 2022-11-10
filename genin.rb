class GeninAT038 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.3.8-x86_64-macosx.tar.gz"
  sha256 "ebc7f7aa69a6f3847589defb089671e04b68ee25cb80ed68a52b1646c06854ee"
  version "0.3.8"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end

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

class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.1-x86_64-macosx.tar.gz"
  sha256 "15ac581d3f658b63b4d746775edfb0777e6867e75b0b08c89e21800695ba12a9"
  version "0.4.1"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
