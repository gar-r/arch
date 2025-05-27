#!/bin/bash
set -euo pipefail

workdir="$(cd "$(dirname "$0")" && pwd)"

sudo $workdir/scripts/secrets.sh    # needs sudo
$workdir/scripts/aur.sh
