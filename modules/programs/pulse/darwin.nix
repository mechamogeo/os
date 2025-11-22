{ user, pkgs, ... }:

let
  pulse-red = pkgs.stdenv.mkDerivation rec {
    pname = "pulse-red";
    version = "0.0.18";

    src = pkgs.fetchurl {
      url = "https://download.pulse.red/installers/Pulse-${version}.dmg";
      sha256 = "7fbf7843b3f4d18de070440f4b70baa89042cb3af216a6e586496829ef157630";
    };

    nativeBuildInputs = [ pkgs.undmg ];

    sourceRoot = ".";

    installPhase = ''
      mkdir -p $out/Applications
      cp -r "Pulse.app" $out/Applications/
    '';

    meta = with pkgs.lib; {
      description = "Minimalistic free time tracker and timesheet app";
      homepage = "https://pulse.red/";
      platforms = platforms.darwin;
    };
  };
in
{
  home-manager.users.${user} = { ... }: {
    home.packages = [ pulse-red ];
  };
}
