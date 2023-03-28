class Genin < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.4.16-x86_64-macosx.tar.gz"
  sha256 "bed83646257885f6d23406a8bbfc7ae5057afdb5f549ae00b2ac67a7057e7451"
  version "0.4.16"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
