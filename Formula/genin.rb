class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.1-x86_64-macosx.tar.gz"
  sha256 "b80ebeaebe6ebf4c82d173ca38ff53213b0ef5a117f64cf6f744ed69abd1be68"
  version "0.5.1"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
