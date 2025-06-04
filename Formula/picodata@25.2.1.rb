class PicodataAT252 < Formula
  desc "Picodata in-memory database and Lua application server"
  homepage "https://picodata.io/"
  url "https://download.picodata.io/tarantool-picodata/macos/picodata-25.2.1.0.tar.gz"
  sha256 "32e4a0e8f64ff3e8c7df4758428bc9e23f43a0d583d0c1c6b0541d4fcce74483"
  license "BSD-2-Clause"
  version_scheme 1
  head "https://git.picodata.io/core/picodata.git", branch: "25.2.1"

  livecheck do
    url :head
    strategy :git
  end

  bottle do
    root_url "https://download.picodata.io/tarantool-picodata/macos/"
    sha256 cellar: :any,  arm64_ventura:    "531e128045063d6930fcf216345acc683f8f81bbeae3527183afe639851c36e9"
    sha256 cellar: :any,  arm64_monterey:   "531e128045063d6930fcf216345acc683f8f81bbeae3527183afe639851c36e9"
    sha256 cellar: :any,  arm64_big_sur:    "531e128045063d6930fcf216345acc683f8f81bbeae3527183afe639851c36e9"
    sha256 cellar: :any,  arm64_sonoma:     "531e128045063d6930fcf216345acc683f8f81bbeae3527183afe639851c36e9"
    sha256 cellar: :any,  arm64_sequoia:    "531e128045063d6930fcf216345acc683f8f81bbeae3527183afe639851c36e9"
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
