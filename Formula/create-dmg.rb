class CreateDmg < Formula
  desc "Shell script to build fancy DMGs"
  homepage "https://github.com/andreyvit/create-dmg"
  url "https://github.com/andreyvit/create-dmg/archive/v1.0.0.7.tar.gz"
  sha256 "36527e3ac845200a575853a4d82a75c4f4b7a902562336f43e8f17e9a1268e86"

  bottle do
    cellar :any_skip_relocation
    sha256 "f79816fe786969d0c2bbf6c025d1616b04add290a20def2492f73295b36bc76c" => :mojave
    sha256 "d99f697bf1d22dba54a87890b30f383bf4aec7ca5b54f180646041f9d046c243" => :high_sierra
    sha256 "d99f697bf1d22dba54a87890b30f383bf4aec7ca5b54f180646041f9d046c243" => :sierra
  end

  def install
    system "support/brew-me.sh"
    bin.install "create-dmg"
  end

  test do
    File.write(testpath/"Brew-Eula.txt", "Eula")
    (testpath/"Test-Source").mkpath
    (testpath/"Test-Source/Brew.app").mkpath
    system "#{bin}/create-dmg", "--sandbox-safe", "--eula", testpath/"Brew-Eula.txt", testpath/"Brew-Test.dmg", testpath/"Test-Source"
  end
end
