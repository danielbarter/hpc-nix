with (import ./nixpkgs {});

let prefix = "/global/home/users/dbarter";
in
  (nix.override {
    storeDir = "${prefix}/nix/store";
    stateDir = "${prefix}/nix/var";
    confDir = "${prefix}/nix/etc";
  }).overrideAttrs (oldAttrs: rec {
    patches = (oldAttrs.patches or []) ++ [./nfs.patch];
  })
