# Mac Kubernetes Local Development (Podman - Minikube - kubctl) in 60 seconds

## Setup our local dev env

In this Quickstart, you will set up Kubernetes local development on a Mac M1 using Podman and Minikube.

Follow the steps below to get your environment up and running in just a minute.

This guide will walk you through the installation and configuration process, ensuring you have a functional kubernetes cluster on your local machine.

Assumptions: 
- You are using ```homebrew``` -> https://brew.sh/
- Command line ```developer tools``` is installed -> https://developer.apple.com/xcode/

If developer tools are not installed, go ahead, open your terminal and run:

	xcode-select --install

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

### Bootstrap fluxcd 

Prerequisites:

1. A new GitHub repository, e.g. [flux-minikube](https://github.com/diablinux/flux-minikube)
NOTE: `This repo has contents already`

2. [PAT](https://github.com/settings/personal-access-tokens) (personal access token) 
3. Run the boostrap command:

```bash
flux bootstrap github --owner=diablinux --repository=flux-minikube --private=false --personal=true  --token-auth --verbose 

Please enter your GitHub personal access token (PAT):
► connecting to github.com
✔ repository "https://github.com/diablinux/flux-minikube" created
► cloning branch "main" from Git repository "https://github.com/diablinux/flux-minikube.git"
✔ cloned repository
► generating component manifests
✔ generated component manifests
✔ committed component manifests to "main" ("2bf8066cd8c6f5711283109ad804ff6864a2acac")
► pushing component manifests to "https://github.com/diablinux/flux-minikube.git"
► installing components in "flux-system" namespace
✔ installed components
✔ reconciled components
► determining if source secret "flux-system/flux-system" exists
► generating source secret
► applying source secret "flux-system/flux-system"
✔ reconciled source secret
► generating sync manifests
✔ generated sync manifests
✔ committed sync manifests to "main" ("0454dcdcd63676229162e570194ae3ebdfe35409")
► pushing sync manifests to "https://github.com/diablinux/flux-minikube.git"
► applying sync manifests
✔ reconciled sync configuration
◎ waiting for GitRepository "flux-system/flux-system" to be reconciled
✔ GitRepository reconciled successfully
◎ waiting for Kustomization "flux-system/flux-system" to be reconciled
✔ Kustomization reconciled successfully
► confirming components are healthy
✔ helm-controller: deployment ready
✔ kustomize-controller: deployment ready
✔ notification-controller: deployment ready
✔ source-controller: deployment ready
✔ all components are healthy
```
4. Clone the repo locally:
```bash
gh repo clone diablinux/flux-minikube
```
5. Pull the repo contents
```bash
cd flux-minikube
git pull
```
The folder structure should look like:
```bash
├── flux-system
│   ├── gotk-components.yaml
│   ├── gotk-sync.yaml
│   └── kustomization.yaml
```

> NOTE: Since we are creating this repo for testing purposes, and since we did not specify any path during flux bootstrap (see --path parameter for more details), flux will observe any files from the root of the repo.

Keep this in mind depending your folder structure strategy.

You can bootstrap existing git repositories, or add different repositories, e.g. a repo for the infrastructure, a repo for the cloud resources, a repo for the configurations, an so forth.

*Final note: You will find my approach on managing cluster addons, apps and cloud resources in the [flux-minikube](https://github.com/diablinux/flux-minikube) repository.*