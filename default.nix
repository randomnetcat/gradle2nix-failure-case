{ pkgs ? import <nixpkgs> {} }:
let
  buildGradle = pkgs.callPackage ./gradle-env.nix {};
in
  buildGradle {
    envSpec = ./gradle-env.json;

    src = ./.;

    gradleFlags = [ "build" ];

    installPhase = ''
      mkdir -p $out
    '';
 }
