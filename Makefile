.PHONY: up

cluster-up: cluster/kind-config.yaml
	@ kind create cluster --name isiak-config --config cluster/kind-config.yaml
	@ kind create cluster --name isiak-control --config cluster/kind-control.yaml
	@ kind create cluster --name isiak-workload --config cluster/kind-workload.yaml

cluster-down:
	@ kind get clusters | grep isiak | xargs -I {} kind delete cluster -n {}

