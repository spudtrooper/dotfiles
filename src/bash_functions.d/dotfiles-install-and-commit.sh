#!/bin/sh

pushd ~/Projects/spudtrooper/dotfiles >/dev/null

./scripts/install.sh
./scripts/commit.sh

popd >/dev/null
