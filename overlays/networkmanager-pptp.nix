# overlays/networkmanager-pptp.nix
self: super: {
  networkmanager-pptp = super.stdenv.mkDerivation rec {
    pname = "networkmanager-pptp";
    version = "1.2.12";

    src = super.fetchurl {
      url = "mirror://gnome/sources/NetworkManager-pptp/${super.lib.versions.majorMinor version}/NetworkManager-pptp-${version}.tar.xz";
      sha256 = "sha256-5fpZ/kYRfw7obpymLGlDvAY4hLBN0jlszsOKLR9BSYI=";
    };

    nativeBuildInputs = with super; [
      pkg-config
      intltool
      autoreconfHook
    ];

    buildInputs = with super; [
      networkmanager
      pptp
      ppp
      gtk3
      gtk4
      libsecret
      libnma
      glib
    ];

    # This is the key fix - patch the source code directly like the original did
    postPatch = ''
      # Remove hardcoded paths first (like original nixpkgs did)
      sed -i -e 's%"\(/usr/sbin\|/usr/pkg/sbin\|/usr/local/sbin\)/[^"]*",%%g' ./src/nm-pptp-service.c

      # Replace specific paths with our nix store paths
      substituteInPlace ./src/nm-pptp-service.c \
        --replace /sbin/pptp ${super.pptp}/bin/pptp \
        --replace /sbin/pppd ${super.ppp}/bin/pppd
    '';

    configureFlags = [
      "--with-gnome"
      "--with-gtkver=3"
      "--localstatedir=/var"
      "--enable-absolute-paths"
    ];

    passthru = {
      networkManagerPlugin = "VPN/nm-pptp-service.name";
    };

    meta = with super.lib; {
      description = "NetworkManager's PPTP plugin";
      homepage = "https://github.com/GNOME/NetworkManager-pptp";
      license = licenses.gpl2Plus;
      maintainers = with maintainers; [ ];
      platforms = platforms.linux;
    };
  };
}
