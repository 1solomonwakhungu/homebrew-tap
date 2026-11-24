class HandoffVerify < Formula
  include Language::Python::Virtualenv

  desc "Deterministic, zero-LLM claim and scope verifier for AI coding agents"
  homepage "https://github.com/1solomonwakhungu/handoff-verify"
  url "https://files.pythonhosted.org/packages/96/af/29ac90e0ac830d75760e8ea3ce380d0230abc2ec1c203a4a78f0a280cb33/handoff_verify-0.1.1.tar.gz"
  sha256 "f5387bf51a48720aa1017975c4494dd394025a05f4192320f2e9b7197eb18082"
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
