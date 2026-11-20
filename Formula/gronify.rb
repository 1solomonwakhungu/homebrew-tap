class Gronify < Formula
  desc "Flatten, search, and unflatten JSON from the command-line"
  homepage "https://github.com/1solomonwakhungu/gronify"
  url "https://github.com/1solomonwakhungu/gronify/releases/download/v1.3.2/gronify-v1.3.2.tar.gz"
  sha256 "1651535d9af0bc118a7f6fd24161d9dde4d68d893709ade0bb337640e6666e6e"
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
