ns := 'redisdemo'

all: cnidemo kubenetdemo cnidemo-calico

cnidemo:
	az aks get-credentials -n cnidemo -g demos
	kubectl apply -k ./overlays/cnidemo

kubenetdemo:
	az aks get-credentials -n kubenetdemo -g demos
	kubectl apply -k ./overlays/kubenetdemo

cnidemo-calico:
	az aks get-credentials -n cnidemo-calico -g demos
	kubectl apply -k ./overlays/cnidemo-calico
