class Karules < Formula
  desc "Ruby DSL for configuring Karabiner-Elements - cleaner, more maintainable keyboard customization for macOS"
  homepage "https://github.com/dzirtusss/karules"
  url "https://rubygems.org/downloads/karules-0.1.0.gem"
  sha256 "deccdcc637b274c239df0216130ff0da27ff8d8853a4d2b0fff0def1311b8577"
  license "MIT"

  uses_from_macos "ruby", since: :catalina

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", cached_download, "--no-document",
           "--ignore-dependencies", "--conservative"
    bin.install libexec/"bin/karules"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "#{bin}/karules", "--version"
  end
end
