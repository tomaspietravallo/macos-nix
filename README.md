# macOS configuration

Inspired by https://carette.xyz/posts/going_immutable_macos/

---

Apply the configuration from this directory:

```sh
sudo -H darwin-rebuild switch --flake .#Tomass-MacBook-Pro
```

## Commit checks

The Darwin configuration installs `pre-commit` through Nix. After applying it,
enable the hooks in each new clone:

```sh
pre-commit install
pre-commit run --all-files
```

Every commit refreshes all flake inputs, checks the flake, and builds the Darwin
system without activating it. Updating inputs requires network access; builds
may download packages and take time. Homebrew installations and macOS activation
are only checked when you apply the configuration.

If the update changes `flake.lock`, pre-commit stops the commit so you can review
the dependency changes, stage the lockfile, and retry:

```sh
git diff -- flake.lock
git add flake.lock
git commit -m "Describe the change"
```

