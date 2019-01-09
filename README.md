c-kubectl
=========

A (small) container to use kubectl via docker.

This is intended for environments where you have a simple (limited
scope) `~/.kube/config` credential file and docker, but do not have
kubectl installed directly (or perhaps a different version).

The image itself is based on Alpine so there is a usable shell.

Usage Example
-------------

    docker run --rm -v $HOME/.kube/config:/root/.kube/config cwedgwood/c-kubectl kubectl get pod --all-namespaces
