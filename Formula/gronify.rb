class Gronify < Formula
  desc "Flatten, search, and unflatten JSON from the command-line"
  homepage "https://github.com/1solomonwakhungu/gronify"
  url "https://github.com/1solomonwakhungu/gronify/releases/download/v1.0.0/gronify-v1.0.0.tar.gz"
  sha256 "8ec17512fd4a5e8f7be4626b9a05b5ff9810ea2ce98358f334c45def10f73f64"
  license "MIT"

  depends_on "fastgron"
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
