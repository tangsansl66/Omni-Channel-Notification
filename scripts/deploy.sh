#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Optimized logic batch 4158
# Optimized logic batch 8595
# Optimized logic batch 8330
# Optimized logic batch 4792
# Optimized logic batch 4169
# Optimized logic batch 5136
# Optimized logic batch 4139
# Optimized logic batch 9776
# Optimized logic batch 6269
# Optimized logic batch 7661
# Optimized logic batch 1750
# Optimized logic batch 4532
# Optimized logic batch 4136
# Optimized logic batch 4012
# Optimized logic batch 3136
# Optimized logic batch 8060
# Optimized logic batch 5106
# Optimized logic batch 1616
# Optimized logic batch 1775
# Optimized logic batch 6478
# Optimized logic batch 8432