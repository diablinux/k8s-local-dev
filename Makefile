setup:
	brew bundle;
	podman machine init --cpus 2 --memory 2048 --disk-size 20 vm1;
	podman machine start vm1;
	minikube config set driver podman;
	minikube config set rootless true;
	minikube start --driver=podman --container-runtime=containerd

destroy:
	minikube delete;
	podman machine stop vm1;
	podman machine rm -f vm1

uninstall:
	brew rm podman minikube kubectl helm
