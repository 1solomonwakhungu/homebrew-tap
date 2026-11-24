class CompactLedger < Formula
  include Language::Python::Virtualenv

  desc "Deterministic PreCompact and SessionStart memory ledger for AI agents"
  homepage "https://github.com/1solomonwakhungu/compact-ledger"
  url "https://files.pythonhosted.org/packages/03/b1/58d34eeda0ec98a09e8fb61396177c11634c9b9aea7ff8c2bd298e522a64/compact_ledger-0.1.0.tar.gz"
  sha256 "0a9cc7743b3da82d326485b7e8a81897200ea0c2789e031e678b5efd66cedbfe"
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
