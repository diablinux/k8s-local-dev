# Mac Kubernetes Local Development (Podman - Minikube - kubctl) in 60 seconds

## Setup our local dev env

In this Quickstart, you will set up Kubernetes local development on a Mac M1 using Podman and Minikube.

Follow the steps below to get your environment up and running in just a minute.

This guide will walk you through the installation and configuration process, ensuring you have a functional kubernetes cluster on your local machine.

## Make commands

	make setup

Installs software packages via brew install. Starts Podman VM and minikube. See Brewfile. 
This will setup a VM called ```vm1``` with 2 CPUs, 2Gb Memory and 20GB of storage.

	make destroy

Deletes a local Kubernetes cluster. This command deletes the VM, and removes all associated files.

	make uninstall

Remove software packages installed via make setup. See Brewfile.

You are done! 

## Next Steps

### Setup helm repositories

#### kube-prometheus-stack for monitoring & alerting dashboards

#### fluxCD

### Deploy test app
