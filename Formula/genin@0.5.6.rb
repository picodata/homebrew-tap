class GeninAT056 < Formula
  desc "Quick inventory generation for tarantool apps"
  homepage "https://github.com/picodata/genin"
  url "https://binary.picodata.io/repository/raw/genin/osx/genin-0.5.6-x86_64-macosx.tar.gz"
  sha256 "2e52fa91e28f4d03ed8e9072ee44e454c9543760992e26602c38250de7d10262"
  version "0.5.6"
  license "BSD-2-Clause license"

  def install
    bin.install "genin"
  end

  test do
    system "#{bin}/genin"
  end
end
