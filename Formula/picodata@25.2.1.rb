class PicodataAT2521 < Formula
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
    sha256 cellar: :any,  arm64_ventura:    "c5554833678f6038ff39ce42a9d2d2bfabdbfc27c7bd1add27c4ac24dca77d5a", tag: :xz
    sha256 cellar: :any,  arm64_monterey:   "c5554833678f6038ff39ce42a9d2d2bfabdbfc27c7bd1add27c4ac24dca77d5a", tag: :xz
    sha256 cellar: :any,  arm64_big_sur:    "c5554833678f6038ff39ce42a9d2d2bfabdbfc27c7bd1add27c4ac24dca77d5a", tag: :xz
    sha256 cellar: :any,  arm64_sonoma:     "c5554833678f6038ff39ce42a9d2d2bfabdbfc27c7bd1add27c4ac24dca77d5a", tag: :xz
    sha256 cellar: :any,  arm64_sequoia:    "c5554833678f6038ff39ce42a9d2d2bfabdbfc27c7bd1add27c4ac24dca77d5a", tag: :xz
    sha256 cellar: :any,  x86_ventura:      "939aea8406e6ee7dff56e53d35b3879b67672fb761881593d6991b159cba135a", tag: :xz
    sha256 cellar: :any,  x86_monterey:     "939aea8406e6ee7dff56e53d35b3879b67672fb761881593d6991b159cba135a", tag: :xz
    sha256 cellar: :any,  x86_big_sur:      "939aea8406e6ee7dff56e53d35b3879b67672fb761881593d6991b159cba135a", tag: :xz
    sha256 cellar: :any,  x86_sonoma:       "939aea8406e6ee7dff56e53d35b3879b67672fb761881593d6991b159cba135a", tag: :xz
    sha256 cellar: :any,  x86_sequoia:      "939aea8406e6ee7dff56e53d35b3879b67672fb761881593d6991b159cba135a", tag: :xz
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
