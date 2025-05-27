#!/bin/bash
set -euo pipefail

# parse args
no_secrets=false
for arg in "$@"; do
    case "$arg" in
        --no-secrets)
            no_secrets=true
            ;;
    esac
done

workdir="$(cd "$(dirname "$0")" && pwd)"

# import secrets first, unless disabled
if [[ "$no_secrets" == "false" ]]; then
    sudo "$workdir/scripts/secrets.sh"
fi

"$workdir/scripts/dotfiles.sh" "$workdir"
"$workdir/scripts/aur.sh"
