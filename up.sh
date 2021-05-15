#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

k3d cluster create testing

kubectl apply -f ./cluster/flux-system/namespace.yaml

kubectl create secret generic flux-system -n flux-system \
        --from-file=identity=$HOME/.ssh/id_github \
        --from-file=identity.pub=$HOME/.ssh/id_github.pub \
        --from-file=known_hosts=$HOME/.ssh/known_hosts

kubectl apply -f ./cluster/flux-system/gotk-components.yaml
kubectl apply -f ./cluster/flux-system/gotk-sync.yaml
