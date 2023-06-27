VERSION="0.1.4"
class Urakil < Formula
    desc "URL shortener via bit.ly, etc."
    homepage "https://github.com/HaguraHikaru/urakil"
    url "https://github.com/HaguraHikaru/urakil/archive/refs/tags/v#{VERSION}.tar.gz"
    sha256 "b23f577398b62efa16533e66e1112c77aa04c3896224cf2dfa6ebfd35914d050"
    license "MIT"
    option "without-completions", "Disable bash completions"
    depends_on "bash-completion@2" => :optional

  # depends_on "cmake" => :build
    def install
        bin.install "urakil"
        bash_completion.install "completions/bash/urakil" if build.with? "completions" 
    end

    test do
        system bin/"urleap", "--version"
    end
end
