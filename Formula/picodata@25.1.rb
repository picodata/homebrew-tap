class PicodataAT251 < Formula
  desc "Picodata in-memory database and Lua application server"
  homepage "https://picodata.io/"
  url "https://download.picodata.io/tarantool-picodata/macos/picodata-25.1.1-0-g38230552.tar.gz"
  sha256 "4e7089d65c8bc9445b0b50e8039498fc38c567b2554a6e351ba0ddf68923fdfb"
  license "BSD-2-Clause"
  version_scheme 1
  head "https://git.picodata.io/core/picodata.git", branch: "25.1.1"
        
  livecheck do
    url :head
    strategy :git
  end

  bottle do
    root_url "https://download.picodata.io/tarantool-picodata/macos/"
    sha256 cellar: :any,  arm64_ventura:    "b2f3bf3069424ad41beda14b5d54fcb63002ddd08d2dae4a8cd73195b969caff"
    sha256 cellar: :any,  arm64_monterey:   "b2f3bf3069424ad41beda14b5d54fcb63002ddd08d2dae4a8cd73195b969caff"
    sha256 cellar: :any,  arm64_big_sur:    "b2f3bf3069424ad41beda14b5d54fcb63002ddd08d2dae4a8cd73195b969caff"
    sha256 cellar: :any,  arm64_sonoma:     "b2f3bf3069424ad41beda14b5d54fcb63002ddd08d2dae4a8cd73195b969caff"
    sha256 cellar: :any,  arm64_sequoia:    "b2f3bf3069424ad41beda14b5d54fcb63002ddd08d2dae4a8cd73195b969caff"
    sha256 cellar: :any,  ventura:          "5b903dad6d1bfbbdbe4599f76161247bf8258e93a1ef8d585eec8a7ea9c3bdc1"
    sha256 cellar: :any,  monterey:         "5b903dad6d1bfbbdbe4599f76161247bf8258e93a1ef8d585eec8a7ea9c3bdc1"
    sha256 cellar: :any,  big_sur:          "5b903dad6d1bfbbdbe4599f76161247bf8258e93a1ef8d585eec8a7ea9c3bdc1"
    sha256 cellar: :any,  sonoma:           "5b903dad6d1bfbbdbe4599f76161247bf8258e93a1ef8d585eec8a7ea9c3bdc1"
    sha256 cellar: :any,  sequoia:          "5b903dad6d1bfbbdbe4599f76161247bf8258e93a1ef8d585eec8a7ea9c3bdc1"
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
