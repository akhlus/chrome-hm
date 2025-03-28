#!/usr/bin/env bash

# Default values
FLAKE_PATH="${FLAKE_PATH:-.}"
MODE="switch"

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--path) FLAKE_PATH="$2"; shift ;;
        -m|--mode) MODE="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done


alejandra "$FLAKE_PATH"

git -C "$FLAKE_PATH" diff

nix flake update "$FLAKE_PATH"

    if ! home-manager "$MODE" --flake "$FLAKE_PATH#home" &> nixos-switch.log; then
        grep --color error nixos-switch.log >&2
        exit 1
    fi

git -C "$FLAKE_PATH" add .


read -p "Do you want to commit the changes? (y/[n]): " commit_choice
if [[ "$commit_choice" == "y" ]]; then
    read -p "Enter commit message: " commit_msg
    git -C "$FLAKE_PATH" commit -m "$commit_msg"
else
    exit 0
fi

read -p "Do you want to push the changes? (y/[n]): " push_choice
if [[ "$push_choice" == "y" ]]; then
    git -C "$FLAKE_PATH" push
fi