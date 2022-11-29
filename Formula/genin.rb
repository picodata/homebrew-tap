class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.9-x86_64-macosx.tar.gz"
  sha256 "6d11f9fd500987ba03627b843b29ea0d1a5496c00d5e3b074bc659378b93417e"
  version "0.4.9"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
