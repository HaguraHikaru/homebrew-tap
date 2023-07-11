VERSION="0.1.6"
class Urakil < Formula
    desc "URL shortener via bit.ly, etc."
    homepage "https://github.com/HaguraHikaru/urakil"
    url "https://github.com/HaguraHikaru/urakil/releases/download/v#{VERSION}/urakil-#{VERSION}_darwin_arm64.tar.gz"
    version VERSION
    sha256 "188b5d78421250eb3d1e0c1110e867ce37f1bf962dcd89ab8becfbdb6fdffd64"
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
