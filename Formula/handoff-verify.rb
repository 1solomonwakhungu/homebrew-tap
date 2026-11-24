class HandoffVerify < Formula
  include Language::Python::Virtualenv

  desc "Deterministic, zero-LLM claim and scope verifier for AI coding agents"
  homepage "https://github.com/1solomonwakhungu/handoff-verify"
  url "https://files.pythonhosted.org/packages/33/09/ddaad42276579f86e1309b52e27bf9ab26a655592f7af63c94ae1de82546/handoff_verify-0.1.0.tar.gz"
  sha256 "f4e3d3d26f7de8ff62099f6b83fad8a75c55fb38efb3fbbb3b67d4d41002ed4c"
  license "MIT"

  depends_on "python@3.14"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/handoff-verify --version")
    assert_match "check", shell_output("#{bin}/handoff-verify --help")

    transcript = testpath/"transcript.jsonl"
    transcript.write <<~JSON
      {"type":"assistant","message":{"role":"assistant","content":[{"type":"text","text":"All done."}]}}
    JSON
    output = shell_output("#{bin}/handoff-verify check #{transcript} --format json")
    assert_equal true, JSON.parse(output)["passed"]
  end
end
