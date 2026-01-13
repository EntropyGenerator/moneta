# shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "moneta";
  
  buildInputs = with pkgs; [
    debootstrap
  ];
  shellHook = ''
  export NIX_ALIEN_LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.glibc}/lib"
    export MONPATH=$PWD
    export PATH=$MONPATH/build/qemu/install/bin:$PATH
  '';
}