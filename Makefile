setup:
	brew bundle;
	podman machine init --cpus 2 --memory 2048 --disk-size 20;
	podman machine start;
	minikube start --driver=podman --container-runtime=cri-o

destroy:
	minikube delete;
	podman machine stop podman-machine-default;
	podman machine rm podman-machine-default

uninstall:
	brew rm podman minikube kubectl helm fluxcd/tap/flux;
	brew cleanup --prune=all
