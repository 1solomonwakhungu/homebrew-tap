class Openrig < Formula
  desc "Local control plane for multi-agent coding topologies"
  homepage "https://github.com/1solomonwakhungu/openrig"
  url "https://github.com/1solomonwakhungu/openrig/releases/download/v0.6.1-fork.2/openrig-0.6.1-fork.2.tgz"
  version "0.6.1-fork.2"
  sha256 "7874239c2d543bed96e9744655dae364970f203b6d7231bc0aa245c47cff505c"
  license "Apache-2.0"

  depends_on "node@22"
  depends_on "tmux"

  uses_from_macos "python" => :build

  def install
    node = Formula["node@22"]
    ENV.prepend_path "PATH", node.opt_bin

    # Scripts must run: better-sqlite3 compiles its native binding and the
    # package's postinstall verifies that binding against this Node.
    system "npm", "install", *std_npm_args(ignore_scripts: false)

    # better-sqlite3 bundles N-API prebuilds for every platform; keep only ours.
    prebuilds = libexec/"lib/node_modules/@openrig/cli/node_modules/better-sqlite3/prebuilds"
    native = "#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.arm? ? "arm64" : "x64"}.node"
    prebuilds.glob("*.node").each { |file| file.unlink if file.basename.to_s != native }

    # Pin both commands to node@22 so the native binding always matches; the
    # daemon is spawned with the same Node as the rig that starts it.
    %w[rig openrig-tui].each do |cmd|
      (bin/cmd).write_env_script libexec/"bin"/cmd, PATH: "#{node.opt_bin}:$PATH"
    end
  end

  def caveats
    <<~EOS
      OpenRig runs agent CLIs inside tmux seats. Install and sign in to the agent
      CLIs you plan to use (for example claude, codex, opencode, or gemini) before
      starting a rig. Supported runtimes are listed in the reference docs:
        https://github.com/1solomonwakhungu/openrig/tree/main/docs/reference/runtimes
    EOS
  end

  test do
    assert_match "0.6.1", shell_output("#{bin}/rig --version")
    assert_match "rig", shell_output("#{bin}/rig --help")

    better_sqlite = libexec/"lib/node_modules/@openrig/cli/node_modules/better-sqlite3"
    script = "const D=require('#{better_sqlite}');const d=new D(':memory:');" \
             "console.log(d.prepare('select 1+1 as v').get().v)"
    assert_equal "2", shell_output("#{formula_opt_bin("node@22")}/node -e \"#{script}\"").strip
  end
end
