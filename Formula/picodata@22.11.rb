class PicodataAT2211 < Formula
  desc "Picodata fork tarantool in-memory database and Lua application server"
  homepage "https://picodata.io/"
  url "https://binary.picodata.io/repository/raw/brew/packages/picodata-22.11.0.214.tar.gz"
  sha256 "883570d71b863bcc5db0fcead53005c9725645419d90cd27df3a310fa54aad2b"
  license "BSD-2-Clause"
  version_scheme 1
  head "https://git.picodata.io/picodata/picodata/picodata.git", branch: "master"

  livecheck do
    url :head
    strategy :git
  end

  bottle do
    root_url "https://binary.picodata.io/repository/raw/brew/bottle"
    sha256 cellar: :any,  arm64_ventura:    "7ff8eadfe6feae6d7fd0288f9b46bf802958f39ab86f6ce49927ce078f5362c0"
    sha256 cellar: :any,  arm64_monterey:   "7ff8eadfe6feae6d7fd0288f9b46bf802958f39ab86f6ce49927ce078f5362c0"
    sha256 cellar: :any,  arm64_big_sur:    "7ff8eadfe6feae6d7fd0288f9b46bf802958f39ab86f6ce49927ce078f5362c0"
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
