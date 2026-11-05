class AcpHost < Formula
  desc "把本机 ACP agent 包成单二进制守护进程，任意语言按行 JSON 调用"
  homepage "https://github.com/thatwzzh/acp-host"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-aarch64-apple-darwin.tar.gz"
      sha256 "96b2f3bb76b3570a2b4420d8d807730ba073b008655e23f1554e65aa0e6c1ae4"
    else
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-x86_64-apple-darwin.tar.gz"
      sha256 "e1b9ba4da6d838c323e0b1301acff2dc2ee21481973580cab7b5038e6fa80257"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20a17889a06501219e5088b653ec782ef13cb41505107008c8a711231db8df26"
    else
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "254ba68635c5b2ac9aab7686bb5f4b82f443b745742d51c6d3f4ff8a3d1cceb3"
    end
  end

  def install
    bin.install "acp-host"
  end

  test do
    output = pipe_output("#{bin}/acp-host", '{"id":"1","method":"agents.list"}' + "\n")
    assert_match '"ok":true', output
  end
end
