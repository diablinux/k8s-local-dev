setup:
	brew bundle;
	minikube start --wait -n 2 --cni bridge --driver=docker --container-runtime=containerd

destroy:
	minikube delete --all --purge

uninstall:
	brew rm minikube kubectl helm fluxcd/tap/flux homebrew/cask/docker;
	brew cleanup --prune=all
