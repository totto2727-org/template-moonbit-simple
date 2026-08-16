{
  lib,
  moonbitToolchain,
  stdenv,
}:

stdenv.mkDerivation {
  pname = "project";
  version = "0.1.0";

  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./moon.mod
      ./src
    ];
  };
  nativeBuildInputs = [ moonbitToolchain ];
  dontConfigure = true;

  buildPhase = ''
    runHook preBuild

    export HOME="$TMPDIR"
    moon build --target native --release

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/bin"
    install -Dm755 _build/native/release/build/project.exe "$out/bin/project"

    runHook postInstall
  '';

  meta = {
    description = "A simple MoonBit command-line application";
    license = lib.licenses.mit;
    mainProgram = "project";
    platforms = lib.platforms.unix;
  };
}
