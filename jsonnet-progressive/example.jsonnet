function (
    name=myappdemo,
    repository="http://192.168.64.98:32578", 
)
    [
     {
      "apiVersion": "helm.fluxcd.io/v1",
      "kind": "HelmRelease",
      "metadata": {
        "name": name,
        "namespace": "maersk-operator"
      },
      "spec": {
        "wait": true,
        "targetNamespace": "default",
        "releaseName": name,
        "chart": {
          "name": "app3tierpython",
          "repository": repository,
          "version": "0.1.2"
        }
      }
    }
    ]
