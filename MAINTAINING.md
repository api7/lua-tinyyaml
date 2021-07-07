## Version Publish

We could publish new version of lua-tinyyaml easily. All you need to do is:

- Create the release PR following the format `feat: release VERSION`, where `VERSION` should be the version used in the rockspec name, like `0.1` for `lua-tinyyaml-0.1-0.rockspec`.

When the PR got merged, it would trigger Github Actions to upload to both github release and luarocks.
