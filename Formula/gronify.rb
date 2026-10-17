class Gronify < Formula
  desc "Flatten, search, and unflatten JSON from the command-line"
  homepage "https://github.com/1solomonwakhungu/gronify"
  url "https://github.com/1solomonwakhungu/gronify/releases/download/v1.1.0/gronify-v1.1.0.tar.gz"
  sha256 "08fb2194e065a5aa4f9d3eccf090af055cd6729191bebbfc96789f379190fd53"
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
