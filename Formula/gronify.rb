class Gronify < Formula
  desc "Flatten, search, and unflatten JSON from the command-line"
  homepage "https://github.com/1solomonwakhungu/gronify"
  url "https://github.com/1solomonwakhungu/gronify/releases/download/v1.2.0/gronify-v1.2.0.tar.gz"
  sha256 "fc7a8a7a4d2e77d4925232fe50ca186a193062e63357a5ef11e7530f4427523e"
  license "MIT"

  depends_on "node@22"

  def install
    libexec.install "gronify"
    bin.write_exec_script libexec/"gronify"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gronify --version")
    assert_match "json.name = \"gronify\"", pipe_output("#{bin}/gronify flatten", '{"name":"gronify"}')
  end
end
