function with-libgccjit
  set --local CC_LIB (nix eval --raw '(let pkgs = import <nixpkgs> {}; in (pkgs.lib.getLib pkgs.stdenv.cc + /lib))')
  set --local GLIBC_LIB (nix eval --raw '(let pkgs = import <nixpkgs> {}; in (pkgs.lib.getLib pkgs.stdenv.glibc + /lib))')
  set --local LIBGCCJIT (nix eval --raw '(let pkgs = import <nixpkgs> {}; in (pkgs.lib.getLib pkgs.libgccjit + /lib/gcc/x86_64-unknown-linux-gnu/9.3.0))')
  LIBRARY_PATH=LIBRARY_PATH:$CC_LIB:$GLIBC_LIB:$LIBGCCJIT $argv
end
