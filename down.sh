#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

k3d cluster delete testing
