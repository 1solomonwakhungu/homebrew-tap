class CompactLedger < Formula
  include Language::Python::Virtualenv

  desc "Deterministic PreCompact and SessionStart memory ledger for AI agents"
  homepage "https://github.com/1solomonwakhungu/compact-ledger"
  url "https://files.pythonhosted.org/packages/b4/7f/06b29a7c9ad06329669bdc061d838eb10c01d1a37ea7af916bd797315eb4/compact_ledger-0.1.1.tar.gz"
  sha256 "b0b6b5a7e34391afb9177e8a3b60220b91bdb5b34b574edbab3bda0df3e0887f"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/compact-ledger --version")
    assert_match "inject", shell_output("#{bin}/compact-ledger --help")

    store = testpath/"store"
    system bin/"compact-ledger", "--store-dir", store, "pin", "--session-id", "brew-test",
           "Never touch migrations"
    output = shell_output("#{bin}/compact-ledger --store-dir #{store} inject --session-id brew-test")
    assert_match "Never touch migrations", output
  end
end
