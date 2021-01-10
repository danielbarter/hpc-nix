with (import ./nixpkgs {});

let prefix = "/global/home/users/dbarter";
in
  nix.overrideAttrs (oldAttrs: rec {
    configureFlags = [ "--with-store-dir=${prefix}/nix/store"
                       "--localstatedir=${prefix}/nix/var"
                       "--sysconfdir=${prefix}/nix/etc"
                       "--enable-gc"
                     ];

    patches = (oldAttrs.patches or []) ++ [./nfs.patch];
      })
