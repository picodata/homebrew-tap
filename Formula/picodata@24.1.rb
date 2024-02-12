class PicodataAT241 < Formula
  desc "Picodata in-memory database and Lua application server"
  homepage "https://picodata.io/"
  url "https://binary.picodata.io/repository/raw/brew/packages/picodata-24.1.1.0.tar.gz"
  sha256 "3b8d00d024b329da8300a276fc355806187e4f6df758a88217602357d2b8184a"
  license "BSD-2-Clause"
  version_scheme 1
  head "https://git.picodata.io/picodata/picodata/picodata.git", branch: "24.1"

  livecheck do
    url :head
    strategy :git
  end

  bottle do
    root_url "https://binary.picodata.io/repository/raw/brew/bottle"
    sha256 cellar: :any,  arm64_ventura:    "94bea20b3fec9207a1b8fa3897c86e6421270fc0c9904268149e70d0d173d44e"
    sha256 cellar: :any,  arm64_monterey:   "94bea20b3fec9207a1b8fa3897c86e6421270fc0c9904268149e70d0d173d44e"
    sha256 cellar: :any,  arm64_big_sur:    "94bea20b3fec9207a1b8fa3897c86e6421270fc0c9904268149e70d0d173d44e"
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
