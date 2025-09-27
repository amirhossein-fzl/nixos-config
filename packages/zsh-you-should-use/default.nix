{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "zsh-you-should-use";
  version = "1.10.0";

  src = fetchFromGitHub {
    owner = "MichaelAquilina";
    repo = "zsh-you-should-use";
    rev = version;
    sha256 = "sha256-dG6E6cOKu2ZvtkwxMXx/op3rbevT1QSOQTgw//7GmSk="; # You may need to update this hash
  };

  strictDeps = true;
  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    runHook preInstall
    
    install -D you-should-use.plugin.zsh $out/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
    install -D README.rst $out/share/zsh/plugins/zsh-you-should-use/README.rst
    
    runHook postInstall
  '';

  meta = with lib; {
    description = "ZSH plugin that reminds you to use existing aliases for commands you just typed";
    homepage = "https://github.com/MichaelAquilina/zsh-you-should-use";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    maintainers = with maintainers; [ ];
  };
}
