{ user, pkgs, ... }:

let
  dia-browser = pkgs.stdenv.mkDerivation rec {
    pname = "dia-browser";
    version = "latest"; #1.6.1-71149

    src = pkgs.fetchurl {
      url = "https://releases.diabrowser.com/release/Dia-${version}.dmg";
      sha256 = "b7df9b2877b6fe94c7855866cacbf5c61a3e42461fa8ef24e0e983acf663a1be";
    };

    nativeBuildInputs = [ pkgs.undmg ];

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/Applications
      cp -r "Dia.app" $out/Applications/
    '';

    meta = with pkgs.lib; {
      description = "AI browser from the makers of Arc";
      homepage = "https://diabrowser.com/";
      platforms = platforms.darwin;
    };
  };
in
{
  home-manager.users.${user} = { ... }: {
    home.packages = [ dia-browser ];
  };
}
