class GeninAT038 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.3.8-x86_64-macosx.tar.gz"
  sha256 "baa091af4758ea206ef65905ff535138ca6cace83ba5909c733288c21f99a2ad"
  version "0.3.8"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
