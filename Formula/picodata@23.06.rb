class PicodataAT2211 < Formula
  desc "Picodata in-memory database and Lua application server"
  homepage "https://picodata.io/"
  url "https://binary.picodata.io/repository/raw/brew/packages/picodata-23.06.0.78.tar.gz"
  sha256 "eb8c2fcec8dc56e0f8ed8105aa2091bad387776378165be6a3b8d4e65baf158b"
  license "BSD-2-Clause"
  version_scheme 1
  head "https://git.picodata.io/picodata/picodata/picodata.git", branch: "master"

  livecheck do
    url :head
    strategy :git
  end

  bottle do
    root_url "https://binary.picodata.io/repository/raw/brew/bottle"
    sha256 cellar: :any,  arm64_ventura:    "a965ab546092dde6c24e897c3859c4e1f063709ffd1643eb00ece8b10f90948d"
    sha256 cellar: :any,  arm64_monterey:   "a965ab546092dde6c24e897c3859c4e1f063709ffd1643eb00ece8b10f90948d"
    sha256 cellar: :any,  arm64_big_sur:    "a965ab546092dde6c24e897c3859c4e1f063709ffd1643eb00ece8b10f90948d"
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
