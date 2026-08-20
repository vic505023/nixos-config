{ # один внешний attrset
	description = "My system configuration";


	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	};

	outputs = { nixpkgs, ... }: { # функция
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				modules = [./configuration.nix];
			};
	};
}
