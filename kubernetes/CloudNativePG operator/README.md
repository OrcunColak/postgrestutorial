The original idea is from  
https://medium.com/@simardeep.oberoi/recommended-approach-for-postgresql-in-kubernetes-83f6acc65303

# Deploy operator

kubectl apply -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.20/releases/cnpg-1.20.4.yaml

# Verify Installation

kubectl get deploy -n cnpg-system cnpg-controller-manager

# Deploy Cluster

kubectl apply -f cluster-example.yaml

# Check Pods

kubectl get pods

kubectl describe deploy -n cnpg-system cluster-example

# Undeploy

kubectl delete -f cluster-example.yaml

kubectl delete -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.20/releases/cnpg-1.20.4.yaml


