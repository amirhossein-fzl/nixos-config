build-system:
	sudo nixos-rebuild switch --flake /etc/nixos#nixos

build-home:
	home-manager switch --flake /etc/nixos

collect-garbage:
    sudo nix-collect-garbage -d
