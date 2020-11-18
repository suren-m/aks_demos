CACHE1_KEY=$CACHE1_KEY
CACHE2_KEY=$CACHE2_KEY
CACHE3_KEY=$CACHE3_KEY

printf 'updating cnidemo..\n'
kubectl create secret generic redis --from-literal=cachekey=$CACHE1_KEY -n redisdemo --dry-run=client -o yaml > ./overlays/cnidemo/secret.yaml

printf 'updating kubenetdemo..\n'
kubectl create secret generic redis --from-literal=cachekey=$CACHE2_KEY -n redisdemo --dry-run=client -o yaml > ./overlays/kubenetdemo/secret.yaml

printf 'updating cnidemo-calico..\n'
kubectl create secret generic redis --from-literal=cachekey=$CACHE3_KEY -n redisdemo --dry-run=client -o yaml > ./overlays/cnidemo-calico/secret.yaml

printf 'done..\n'
