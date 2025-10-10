final: prev: {
  zsh-you-should-use = prev.callPackage ../packages/zsh-you-should-use.nix { };
  throne = prev.callPackage ../packages/throne { };
  protorpc = prev.callPackage ../packages/protorpc { };
}
