VERSION="0.1.5"
class Urakil < Formula
    desc "URL shortener via bit.ly, etc."
    homepage "https://github.com/HaguraHikaru/urakil"
    url "https://github.com/HaguraHikaru/urakil/archive/refs/tags/v#{VERSION}.tar.gz"
    sha256 "45e859e88131719d62bfec2b6ee4320979608e5aadf4c3cf56afd2eda65cd581"
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
