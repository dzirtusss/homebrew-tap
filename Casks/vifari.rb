cask "vifari" do
  version "0.0.8"
  sha256 "fda9481909f046854b42e3f8a0c0d89e514db3e897235a8d1777f0da0f1588ad"

  name "Vifari"
  desc "Vim-like keyboard navigation for Safari in pure Lua"
  homepage "https://github.com/dzirtusss/vifari"
  url "https://github.com/dzirtusss/vifari/archive/refs/tags/v#{version}.tar.gz"

  depends_on cask: "hammerspoon"

  artifact "vifari-#{version}", target: "#{ENV["HOME"]}/.hammerspoon/Spoons/Vifari.spoon"

  zap trash: [
    "~/.hammerspoon/Spoons/Vifari.spoon",
  ]

  caveats <<~EOS
    To complete installation:
      1. Open ~/.hammerspoon/init.lua
      2. Add the following lines:

          hs.loadSpoon("Vifari")
          spoon.Vifari:start(... optional config here ...)

      3. Restart Hammerspoon
  EOS
end
