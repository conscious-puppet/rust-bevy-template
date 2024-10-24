{ inputs, ... }:

{
  flake = rec {
    templates.default = {
      description = "A Rust bevy project template for Nix";
      path = builtins.path { path = inputs.self; };
    };

    # https://omnix.page/om/init.html#spec
    om.templates.rust-bevy-template = {
      template = templates.default;
      params = [
        {
          name = "package-name";
          description = "Name of the Rust package";
          placeholder = "rust-bevy-template";
        }
        {
          name = "author";
          description = "Author name";
          placeholder = "Abhishek Singh";
        }
        {
          name = "author-email";
          description = "Author email";
          placeholder = "abhishek17513@gmail.com";
        }
        {
          name = "nix-template";
          description = "Keep the flake template in the project";
          paths = [ "**/template.nix" ];
          value = false;
        }
      ];
      tests = {
        default = {
          params = {
            package-name = "qux";
            author = "John";
            author-email = "john@example.com";
          };
          asserts = {
            source = {
              "Cargo.toml" = true;
              "flake.nix" = true;
              "nix/modules/template.nix" = false;
            };
            packages.default = {
              "bin/qux" = true;
            };
          };
        };
      };
    };
  };
}
