class Sidefx < Formula
  include Language::Python::Virtualenv

  desc "Outbound effects journal, MCP proxy, and receipts for AI agents"
  homepage "https://github.com/1solomonwakhungu/sidefx"
  url "https://files.pythonhosted.org/packages/f3/13/96c26ba703f6ddf7eacc195cfb0eedf0d0bdd66304d479341bd6073a3474/sidefx-0.1.0.tar.gz"
  sha256 "7e377dffcd34e8ebebc04cd18f0afe61d8672f108348b8de70c973dada40702c"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sidefx --version")
    assert_match "mcp-proxy", shell_output("#{bin}/sidefx --help")

    config = testpath/".sidefx.json"
    system bin/"sidefx", "init", "--path", config
    assert_path_exists config
    output = shell_output("#{bin}/sidefx --db #{testpath}/sidefx.db status --json")
    assert_equal 0, JSON.parse(output)["total"]
  end
end
