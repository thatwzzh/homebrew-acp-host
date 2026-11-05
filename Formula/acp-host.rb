class AcpHost < Formula
  desc "把本机 ACP agent 包成单二进制守护进程，任意语言按行 JSON 调用"
  homepage "https://github.com/thatwzzh/acp-host"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-aarch64-apple-darwin.tar.gz"
      sha256 "0fa8a0a2824fd8b7b37c6af478824b70efabc6d3e5a41f2dda8d6e8a42b5413e"
    else
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-x86_64-apple-darwin.tar.gz"
      sha256 "0c1b903586390c3316c53de502c2c6fe497221b978c472ddd4e23ac1d3e2c1d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d488f691065586ec30b801fa4ae7987df3e65e1ab80f48ba226dff79e599279a"
    else
      url "https://github.com/thatwzzh/acp-host/releases/download/v#{version}/acp-host-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "08390f16b20c0e5644c29ebd0980ea77732b0ce1979afc2d780d6abfe54983b7"
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
