VERSION="0.1.6"
class Urakil < Formula
    desc "URL shortener via bit.ly, etc."
    homepage "https://github.com/HaguraHikaru/urakil"
    url "https://github.com/HaguraHikaru/urakil/releases/download/v#{VERSION}/urakil-#{VERSION}_darwin_arm64.tar.gz"
    version VERSION
    sha256 "6a42feb0e969eff9d3bb0fbdf7f3c0bc1b00b11a1b8b09efcae18116882c1122"
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
