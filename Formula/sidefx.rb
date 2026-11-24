class Sidefx < Formula
  include Language::Python::Virtualenv

  desc "Outbound effects journal, MCP proxy, and receipts for AI agents"
  homepage "https://github.com/1solomonwakhungu/sidefx"
  url "https://files.pythonhosted.org/packages/60/7b/f0eb9fc60d83149ace9e3dd7cc80276c0fa2ad2bfedc0c86f3e7a82e0891/sidefx-0.1.2.tar.gz"
  sha256 "4309563bd9053660181ff28b00dd985a0d595ae5e964be9ecc8d0d3c286dc4e7"
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
