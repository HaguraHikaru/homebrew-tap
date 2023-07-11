VERSION="0.1.5"
class Urakil < Formula
    desc "URL shortener via bit.ly, etc."
    homepage "https://github.com/HaguraHikaru/urakil"
    url "https://github.com/HaguraHikaru/urakil/releases/download/v#{VERSION}/urakil-#{VERSION}_darwin_arm64.tar.gz"
    version VERSION
    sha256 "d858cb18e3d9f8ecbe4c536f5c43f38e00ab1babf799295ede7426c5ea24bcaa"
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
