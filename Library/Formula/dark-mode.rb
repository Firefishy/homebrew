class DarkMode < Formula
  homepage "https://github.com/sindresorhus/dark-mode"
  url "https://github.com/sindresorhus/dark-mode/archive/1.0.1.tar.gz"
  sha256 "7c71d865ad1a058c98909b442cdeef6b95be62313909c176a9e58db0a7512902"
  head "https://github.com/sindresorhus/dark-mode.git"

  bottle do
    cellar :any
    sha256 "f58b190cb89027daaea97e8cdc31bc4f097c51fef33e805751a1aef797871e5f" => :yosemite
  end

  depends_on :macos => :yosemite
  depends_on :xcode => :build

  def install
    xcodebuild "install",
               "SYMROOT=build",
               "DSTROOT=#{prefix}",
               "INSTALL_PATH=/bin",
               "ONLY_ACTIVE_ARCH=YES"
  end

  test do
    system "#{bin}/dark-mode", "--mode"
  end
end
