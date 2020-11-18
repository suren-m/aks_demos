ns := 'redisdemo'

deploy-all: cnidemo kubenetdemo cnidemo-calico

all-results: cnidemo-results kubenetdemo-results cnidemo-calico-results

cnidemo:
	kubectl config use-context cnidemo
	kubectl apply -k ./overlays/cnidemo

kubenetdemo:
	kubectl config use-context kubenetdemo
	kubectl apply -k ./overlays/kubenetdemo

cnidemo-calico:
	kubectl config use-context cnidemo-calico
	kubectl apply -k ./overlays/cnidemo-calico

cnidemo-results:
	kubectl config use-context cnidemo
	kubectl get pod -n redisdemo -o jsonpath={..metadata.name} | \
		xargs -I podname \
		kubectl cp -c redisbench \
			redisdemo/podname:/scripts/results \
			./results/cnidemo-results

kubenetdemo-results:
	kubectl config use-context kubenetdemo
	kubectl get pod -n redisdemo -o jsonpath={..metadata.name} | \
		xargs -I podname \
		kubectl cp -c redisbench \
			redisdemo/podname:/scripts/results \
			./results/kubenetdemo-results

cnidemo-calico-results:
	kubectl config use-context cnidemo-calico
	kubectl get pod -n redisdemo -o jsonpath={..metadata.name} | \
		xargs -I podname \
		kubectl cp -c redisbench \
			redisdemo/podname:/scripts/results \
			./results/cnidemo-calico-results

delete-all:
	kubectl config use-context cnidemo
	kubectl delete ns redisdemo --force
	kubectl config use-context kubenetdemo
	kubectl delete ns redisdemo --force
	kubectl config use-context cnidemo-calico
	kubectl delete ns redisdemo --force
