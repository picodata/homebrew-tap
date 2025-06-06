class PicodataAT252 < Formula
  desc "Picodata in-memory database and Lua application server"
  homepage "https://picodata.io/"
  url "https://download.picodata.io/tarantool-picodata/macos/picodata-25.2.1.0.tar.xz"
  sha256 "568a316af024da6cec396b7cc24bc1cc800b093acb809fdb8e1d10275d84008c"
  license "BSD-2-Clause"
  version_scheme 1
  head "https://git.picodata.io/core/picodata.git", branch: "25.2.1"

  livecheck do
    url :head
    strategy :git
  end

  bottle do
    root_url "https://download.picodata.io/tarantool-picodata/macos/"
    sha256 cellar: :any,  arm64_ventura:    "5fb8e73f3f4d680cf16d53c61d2a264911371e21e413ba220026e0e2b2ae981f"
    sha256 cellar: :any,  arm64_monterey:   "5fb8e73f3f4d680cf16d53c61d2a264911371e21e413ba220026e0e2b2ae981f"
    sha256 cellar: :any,  arm64_big_sur:    "5fb8e73f3f4d680cf16d53c61d2a264911371e21e413ba220026e0e2b2ae981f"
    sha256 cellar: :any,  arm64_sonoma:     "5fb8e73f3f4d680cf16d53c61d2a264911371e21e413ba220026e0e2b2ae981f"
    sha256 cellar: :any,  arm64_sequoia:    "5fb8e73f3f4d680cf16d53c61d2a264911371e21e413ba220026e0e2b2ae981f"
    sha256 cellar: :any,  ventura:    "e18fc95b000c8c569ca28c7ea43930055a6876d506dda052d35257eb13da2c5a"
    sha256 cellar: :any,  monterey:   "e18fc95b000c8c569ca28c7ea43930055a6876d506dda052d35257eb13da2c5a"
    sha256 cellar: :any,  big_sur:    "e18fc95b000c8c569ca28c7ea43930055a6876d506dda052d35257eb13da2c5a"
    sha256 cellar: :any,  sonoma:     "e18fc95b000c8c569ca28c7ea43930055a6876d506dda052d35257eb13da2c5a"
    sha256 cellar: :any,  sequoia:    "e18fc95b000c8c569ca28c7ea43930055a6876d506dda052d35257eb13da2c5a"
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
