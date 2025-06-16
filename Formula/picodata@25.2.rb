class PicodataAT252 < Formula
  desc "Picodata in-memory database and Lua application server"
  homepage "https://picodata.io/"
  url "https://download.picodata.io/tarantool-picodata/sources/picodata-25.2.1.0.tar.xz"
  sha256 "e6a77ce8d6d8373fefce398a8c327dea82eff061c00ecff2662c42847b8645c9"
  license "BSD-2-Clause"
  version_scheme 1
  head "https://git.picodata.io/core/picodata.git", branch: "25.2.1"

  livecheck do
    url :head
    strategy :git
  end

  bottle do
    root_url "https://download.picodata.io/tarantool-picodata/macos"
    sha256 cellar: :any,  arm64_ventura:    "64e62a4bff94d73c8d64154c18b125b468384a736afa0fe1343c26039546d512"
    sha256 cellar: :any,  arm64_monterey:   "64e62a4bff94d73c8d64154c18b125b468384a736afa0fe1343c26039546d512"
    sha256 cellar: :any,  arm64_big_sur:    "64e62a4bff94d73c8d64154c18b125b468384a736afa0fe1343c26039546d512"
    sha256 cellar: :any,  arm64_sonoma:     "64e62a4bff94d73c8d64154c18b125b468384a736afa0fe1343c26039546d512"
    sha256 cellar: :any,  arm64_sequoia:    "64e62a4bff94d73c8d64154c18b125b468384a736afa0fe1343c26039546d512"
    sha256 cellar: :any,  ventura:          "e8fee71744d65959bd3c4965b8901a1336bf98f12bb5edaeee41293fe3fdf1fd"
    sha256 cellar: :any,  monterey:         "e8fee71744d65959bd3c4965b8901a1336bf98f12bb5edaeee41293fe3fdf1fd"
    sha256 cellar: :any,  big_sur:          "e8fee71744d65959bd3c4965b8901a1336bf98f12bb5edaeee41293fe3fdf1fd"
    sha256 cellar: :any,  sonoma:           "e8fee71744d65959bd3c4965b8901a1336bf98f12bb5edaeee41293fe3fdf1fd"
    sha256 cellar: :any,  sequoia:          "e8fee71744d65959bd3c4965b8901a1336bf98f12bb5edaeee41293fe3fdf1fd"
  end

  depends_on "cmake" => :build
  depends_on "icu4c"
  depends_on "libyaml"
  depends_on "openssl@3"
  depends_on "readline"
  depends_on "zstd"

  uses_from_macos "curl"
  uses_from_macos "ncurses"

  def install
    # Avoid keeping references to Homebrew's clang/clang++ shims
    inreplace "src/trivia/config.h.cmake",
              "#define COMPILER_INFO \"@CMAKE_C_COMPILER_ID@-@CMAKE_C_COMPILER_VERSION@\"",
              "#define COMPILER_INFO \"/usr/bin/clang /usr/bin/clang++\""

    if OS.mac?
      if MacOS.version >= :big_sur
        sdk = MacOS.sdk_path_if_needed
        lib_suffix = "tbd"
      else
        sdk = ""
        lib_suffix = "dylib"
      end
    end

    system "make"
    system "make", "install"
  end

  test do
    system bin/"picodata", "test"
  end
end
