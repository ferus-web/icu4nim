with import <nixpkgs> { };

mkShell {
  nativeBuildInputs = [
    pkg-config
    simdutf
    icu76
    nph
  ];

  LD_LIBRARY_PATH = lib.makeLibraryPath [
    icu76.dev
    simdutf
  ];
}
