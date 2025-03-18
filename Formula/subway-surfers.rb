class SubwaySurfers < Formula
  desc "Play Subway Surfers in terminal ASCII mode"
  homepage "https://github.com/evanreilly/subwaysurfers"
  url "https://github.com/evanreilly/subwaysurfers/archive/refs/tags/v1.3.3.7.zip"
  version "1.3.3.7"
  sha256 "b13dc3b5b13778d52563291337202c9696ee896630ad23d233d33e112c9cb093"

  depends_on "mplayer"
  depends_on "libcaca"

  def install
    # Homebrew automatically extracts zip files into the build directory.
    prefix.install "subway-surfers.mp4"

    # Install an executable script
    (bin/"subway-surfers").write <<~EOS
      #!/bin/bash
      exec mplayer -really-quiet -vo caca "#{prefix}/subway-surfers.mp4"
    EOS
  end

  test do
    assert_predicate prefix/"subway-surfers.mp4", :exist?
  end
end

