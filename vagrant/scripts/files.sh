#!/usr/bin/env bash

echo "Copying static files"
cp config/etc/hosts /etc/hosts
cp config/etc/resolv.conf /etc/resolv.conf
#cp config/k8s.conf /etc/sysctl.d/k8s.conf
#cp config/kubernetes.repo /etc/yum.repos.d/kubernetes.repo
