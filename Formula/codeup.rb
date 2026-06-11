class Codeup < Formula
  desc "CLI for Aliyun Yunxiao Codeup (create merge requests, etc.)"
  homepage "https://github.com/foundralab/codeup-cli"
  url "https://github.com/foundralab/codeup-cli/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4d7df3aca41176a38d659c2826d9041e099720b0dc7ec9db5fa73db18515d084"
  license "MIT"
  head "https://github.com/foundralab/codeup-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/foundralab/codeup-cli/internal/cli.version=#{version}"
    system "go", "build", *std_go_args(output: bin/"codeup", ldflags: ldflags), "./cmd/codeup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codeup --version")
  end
end
