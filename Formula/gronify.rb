class Gronify < Formula
  desc "Flatten, search, and unflatten JSON from the command-line"
  homepage "https://github.com/1solomonwakhungu/gronify"
  url "https://github.com/1solomonwakhungu/gronify/releases/download/v1.3.1/gronify-v1.3.1.tar.gz"
  sha256 "6a6711d383f03386e95a0666c68d019bd08e0f5f83dadbfad0e4524e16dc3247"
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
