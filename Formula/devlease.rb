class Devlease < Formula
  desc "Throwaway Android emulators and iOS simulators for parallel AI coding agents"
  homepage "https://github.com/gohlinka2/devlease"
  url "https://github.com/gohlinka2/devlease/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "6abb689b70467cd96acc8be1878c887d63058b7d32cebd4bfe1cdea7f9e5790e"
  license "MIT"

  # Python 3 comes with the Xcode command line tools, which Homebrew requires anyway.
  depends_on :macos

  def install
    bin.install "devlease"
    (share/"devlease").install "skills", "snippets"
  end

  def caveats
    <<~EOS
      Next steps:
        npx skills add gohlinka2/devlease -g -y   # agent skill
        devlease hooks install                    # guard hooks for your agents
        devlease init android                     # create the device masters
        devlease init ios
        devlease doctor
      Details: https://github.com/gohlinka2/devlease#install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/devlease --version")
    assert_path_exists share/"devlease/skills/devlease/SKILL.md"
  end
end
