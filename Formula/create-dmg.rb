class CreateDmg < Formula
  desc "Shell script to build fancy DMGs"
  homepage "https://github.com/create-dmg/create-dmg"
  url "https://github.com/create-dmg/create-dmg/archive/v1.0.9.tar.gz"
  sha256 "f0284d0a386353cd127df2f15af526c821995c664ba4063863ee500a374aada4"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "862e35170855882f5aef6be695f4e3134b71889529f68e85af6a7c9b4278fff8"
    sha256 cellar: :any_skip_relocation, big_sur:       "579aa12677f4d4772436afbf22e730bd0be8a8045597995c9aadd94a8f0a77d1"
    sha256 cellar: :any_skip_relocation, catalina:      "42ba5df600cee3cc0c2ea3da594e2c09b710e93345f36941bf11cbece30464be"
    sha256 cellar: :any_skip_relocation, mojave:        "42ba5df600cee3cc0c2ea3da594e2c09b710e93345f36941bf11cbece30464be"
    sha256 cellar: :any_skip_relocation, high_sierra:   "42ba5df600cee3cc0c2ea3da594e2c09b710e93345f36941bf11cbece30464be"
  end

  def install
    system "make", "install", "prefix=#{prefix}"
  end

  test do
    File.write(testpath/"Brew-Eula.txt", "Eula")
    (testpath/"Test-Source").mkpath
    (testpath/"Test-Source/Brew.app").mkpath
    system "#{bin}/create-dmg", "--sandbox-safe", "--eula",
           testpath/"Brew-Eula.txt", testpath/"Brew-Test.dmg", testpath/"Test-Source"
  end
end
