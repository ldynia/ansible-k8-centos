#!/usr/bin/env bash

if [ -f /usr/bin/kubectl ]; then
  source <(kubectl completion bash)
fi

if [ -f /usr/bin/kubeadm ]; then
  source <(kubeadm completion bash)
fi
