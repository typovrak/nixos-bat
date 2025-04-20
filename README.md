# nixos-bat

nixos-bat = fetchGit {
	url = "https://github.com/typovrak/nixos-bat.git";
	ref = "main";
};

(import "${nixos-bat}/configuration.nix")
