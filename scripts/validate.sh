#!/usr/bin/env bash
set -euo pipefail
kubectl get nodes
kubectl get deploy,pods,svc -n mern
kubectl rollout status deployment/frontend -n mern --timeout=180s
kubectl rollout status deployment/hello -n mern --timeout=180s
kubectl rollout status deployment/profile -n mern --timeout=180s
