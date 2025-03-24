setup:
	brew bundle;
	podman machine init --cpus 2 --memory 2048 --disk-size 20;
	podman machine set --rootful
	podman machine start;
        podman network create minikube --driver=bridge --subnet=192.168.49.0/24 --gateway=192.168.49.1
	minikube start --driver="podman"

destroy:
	minikube delete --all --purge=true;
	podman machine stop podman-machine-default;
	podman machine rm podman-machine-default

uninstall:
	brew rm podman minikube kubectl helm fluxcd/tap/flux;
	brew cleanup --prune=all
	rm -rf ~/.minikube
	rm -rf ~/.config/containers/podman*
