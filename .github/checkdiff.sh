#!/bin/sh
set -e

if ! git diff --quiet HEAD --; then
    echo 'Uncommitted changes detected:'
    git diff --stat HEAD --
    exit 1
fi
