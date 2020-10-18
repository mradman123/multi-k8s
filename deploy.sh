docker build -t mradman/multi-client -f ./client/Dockerfile ./client
docker build -t mradman/multi-server -f ./server/Dockerfile ./server
docker build -t mradman/multi-worker -f ./worker/Dockerfile ./worker
docker push mradman/multi-client
docker push mradman/multi-server
docker push mradman/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/worker-deployment