# kafka-fleet-manager helm chart
Helm chart to deploy Kafka Fleet Manager. **Docs coming soon**

## Description

## Install

```sh
helm repo add platformatory https://platformatory.github.io/fleet-manager-helm
helm repo update

helm install kafka-fleet-manager platformatory/kafka-fleet-manager \
    -n kafka-fleet-manager \
    --create-namespace
```