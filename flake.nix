{
  description = "Jasi's NixOS config 🦇";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    eldritch = {
      url = "github:eldritch-theme/eldritch.nvim";
      flake = false;
    };
    everforest-lua = {
      url = "github:neanias/everforest-nvim";
      flake = false;
    };
    markdown = {
      url = "github:MeanderingProgrammer/markdown.nvim";
      flake = false;
    };
    puffer-fish = {
      url = "github:nickeb96/puffer-fish";
      flake = false;
    };
    blink-cmp-copilot = {
      url = "github:giuxtaposition/blink-cmp-copilot";
      flake = false;
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "aarch64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./overlays.nix inputs) ];
      };
    in
    {
      nixosConfigurations.jasi = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          home-manager.nixosModule
          # Todo
          # ./host/configuration.nix
        ];
      };

      homeConfigurations.jasi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          nixvim.homeManagerModules.nixvim
          ./home/home.nix
        ];
      };
    };
}
