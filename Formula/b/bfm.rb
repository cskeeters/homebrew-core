class Bfm < Formula
  desc "TUI file manager"
  homepage "https://github.com/cskeeters/betty-file-manager"
  url "https://github.com/cskeeters/betty-file-manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2019276e029b5aab58bc4722f1762c8f281bfc82da6711cb431fbac2517ee8d5"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    pkgshare.install Dir["plugins/*"]
  end

  def caveats
    <<~EOS
      You must install the plugins in your home directory
        mkdir -p ~/.config/bfm/plugins
        cp -rp #{share}/* ~/.config/bfm/plugins
    EOS
  end

  test do
    system "which", "bfm"
  end
end
