cask "codeup" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.1"
  sha256 arm:   "759f8bcc81cc463a744226efbc94e538cfed7e7c81a2bfd3c9b3d21a9e04e8fe",
         intel: "b7f47debe440320b18d0946f22bfcd363a7473b7c13e92de65afbb61c0d95be6"

  url "https://github.com/foundralab/codeup-cli/releases/download/v#{version}/codeup-#{version}-darwin-#{arch}.tar.gz"
  name "codeup"
  desc "CLI for Aliyun Yunxiao Codeup (create merge requests, etc.)"
  homepage "https://github.com/foundralab/codeup-cli"

  binary "codeup"

  postflight do
    if system_command("/usr/bin/xattr", args: ["-h"]).exit_status == 0
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/codeup"]
    end
  end
end
