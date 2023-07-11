VERSION="0.1.5"
class Urakil < Formula
    desc "URL shortener via bit.ly, etc."
    homepage "https://github.com/HaguraHikaru/urakil"
    url "https://github.com/HaguraHikaru/urakil/archive/refs/tags/v0.1.5.tar.gz"
    version VERSION
    sha256 "9acaac942b4617ac01495de24da482be902d7dc1ea05b8947452f288a248c7f9"
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
