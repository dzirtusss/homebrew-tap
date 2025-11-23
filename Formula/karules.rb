class Karules < Formula
  desc "Ruby DSL for configuring Karabiner-Elements - cleaner, more maintainable keyboard customization for macOS"
  homepage "https://github.com/dzirtusss/karules"
  url "https://rubygems.org/downloads/karules-0.2.0.gem"
  sha256 "9dd21dc83d6cb670b51bd05ead2a0796204eda303d78535d1ad4422536d6668b"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "install", cached_download, "--no-document"
    bin.install libexec/"bin/karules"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match "karules #{version}", shell_output("#{bin}/karules --version")
    assert_match "Usage: karules", shell_output("#{bin}/karules --help")
  end
end
