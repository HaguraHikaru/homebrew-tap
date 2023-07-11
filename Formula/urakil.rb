VERSION="0.1.6"
class Urakil < Formula
    desc "URL shortener via bit.ly, etc."
    homepage "https://github.com/HaguraHikaru/urakil"
    url "https://github.com/HaguraHikaru/urakil/releases/download/v#{VERSION}/urakil-#{VERSION}_darwin_arm64.tar.gz"
    version VERSION
    sha256 "6d5f83e2ddf1a5badba9f2e6bff7cdc8d4a32f2a4dc24c16d5342f2d0380088d"
    license "MIT"

    option "without-completions", "Disable bash completions"
    depends_on "bash-completion@2" => :optional

  # depends_on "cmake" => :build
    def install
        bin.install "urakil"
        bash_completion.install "completions/bash/urakil" if build.with? "completions" 
    end

    test do
        system bin/"urakil", "--version"
    end
end
