Materials to build a self contained nix store in an environment with network filesystem where you don't have root access and user namespaces are not switched on.

The main downside of this approach (compared to the proot approach) is that you won't be able to utilize exising nix caches, since they assume that the store is located at /nix/store. Everything will be recompiled from scratch.

# Instructions:

1. Set prefix in `hpc-nix.nix` to the full path of target home directory.
2. run `./build.sh`
3. copy `/tmp/copy-me-to-server` over the target and move `copy-me-to-server/nix` to the correct location
4. Add `sandbox = false` and `use-sqlite-wal = false` to `~/.config/nix/nix.conf`. The first disables sandbox building which depends on user namespaces. The second is required for sqlite to function correctly on a network filesystem



# Environment variables:

- set `NIX_SSL_CERT_FILE` on the target so nix can fetch things over https
- set `NIX_PATH=nixpkgs=<location of nixpkgs>`
- If `/tmp` is mounted to a small device, you may want to set `TMPDIR`
