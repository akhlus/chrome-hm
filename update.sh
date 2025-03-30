#!/usr/bin/env bash

FLAKE_PATH="${FLAKE_PATH:-.}"
MODE="switch"
FORMAT="true"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--path) FLAKE_PATH="$2"; shift ;;
        -m|--mode) MODE="$2"; shift ;;
        -f|--format) FORMAT="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if git -C "$FLAKE_PATH" diff --quiet; then
    read -p "No changes detected - proceed anyway? [y]/n" cont
    cont=${cont:-y}  # Default to 'y'
    if [[ "$cont" == "n" ]]; then
        exit 0
    fi
fi

if [[ "$format" == "true" ]]; then
    alejandra "$FLAKE_PATH"
fi

git -C "$FLAKE_PATH" add .

git -C "$FLAKE_PATH" diff --staged -U0

nix flake update "$FLAKE_PATH"

if ! home-manager "$MODE" --flake "$FLAKE_PATH#home" &> update.log; then
    grep --color error update.log >&2
    exit 1
fi

date=$(date '+%Y-%m-%d-%H-%M')
read -p "Do you want to commit the changes? (y/[n]): " commit_choice
if [[ "$commit_choice" == "y" ]]; then
    read -p "Enter commit message: " commit_msg
    git -C "$FLAKE_PATH" commit -am "$date $commit_msg"
else
    exit 0
fi

read -p "Do you want to push the changes? (y/[n]): " push_choice
if [[ "$push_choice" == "y" ]]; then
    git -C "$FLAKE_PATH" push
fi
