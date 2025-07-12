#!/bin/bash

echo " Starting Minikube (if not running)..."
minikube status || minikube start --driver=docker

echo " Applying namespace and resource quota..."
kubectl apply -f namespace.yaml --validate=false
kubectl apply -f resource-quota.yaml --validate=false

echo " Deploying Redis..."
kubectl apply -f redis/ --validate=false

echo " Deploying PostgreSQL..."
kubectl apply -f postgres/ --validate=false

echo " Deploying Voting App..."
kubectl apply -f vote/ --validate=false

echo " Deploying Result App..."
kubectl apply -f result/ --validate=false

echo " Deploying Worker..."
kubectl apply -f worker/ --validate=false

echo " Waiting for pods to be ready..."
kubectl wait --for=condition=Ready pod --all -n vote --timeout=120s

echo " Opening Vote and Result Apps in Browser..."
minikube service vote-service -n vote
minikube service result-service -n vote
