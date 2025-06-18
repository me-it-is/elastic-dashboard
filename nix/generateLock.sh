#!/usr/bin/env bash
nix-shell
cd ..
pub2nix-lock
exit
yq . pubspec.lock > pubspec.lock.json