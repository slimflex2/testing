#!/usr/bin/env bash

kubectl config set-cluster fuchicorp-cluster --server=https://kubernetes.default --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
kubectl config set-context fuchicorp-context --cluster=fuchicorp-cluster
kubectl config set-credentials fuchicorp-user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)"
kubectl config set-context fuchicorp-context --user=fuchicorp-user
kubectl config use-context fuchicorp-context
