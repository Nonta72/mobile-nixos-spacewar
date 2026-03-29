{
  mobile-nixos,
  fetchFromGitHub,
  ...
}:

# SC7280 is a compute variant of the SM7325
mobile-nixos.kernel-builder {
  version = "6.19.0";
  configfile = ./config.aarch64;

  src = fetchFromGitHub {
    owner = "sc7280-mainline";
    repo = "linux";
    rev = "2f12f5e50225dcd556455e7a4dc4751832b7be88";
    hash = "sha256-BNB5qA01bQVh2nCSqLSllw1ktyIiHPV1Ybee+jVvO+0=";
  };

  patches = [
    ./nothing-spacewar-audio.patch
  ];

  isModular = true;
  isCompressed = "gz";
}
