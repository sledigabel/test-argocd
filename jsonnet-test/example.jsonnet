function (
    containerPort=8080,
    image="docker.io/sledigabel/test-argocd-app", 
    tag="prod", 
    name="jsonnet-guestbook-ui",
    replicas=1,
    servicePort=80, 
    type="NodePort"
)
    [
    {
        "apiVersion": "v1",
        "kind": "Service",
        "metadata": {
            "name": name
        },
        "spec": {
            "ports": [
                {
                "port": servicePort,
                "targetPort": containerPort
                }
            ],
            "selector": {
                "app": name
            },
            "type": type
        }
    },
    {
        "apiVersion": "apps/v1",
        "kind": "Deployment",
        "metadata": {
            "name": name
        },
        "spec": {
            "replicas": replicas,
            "revisionHistoryLimit": 3,
            "selector": {
                "matchLabels": {
                "app": name
                },
            },
            "template": {
                "metadata": {
                "labels": {
                    "app": name
                }
                },
                "spec": {
                "containers": [
                    {
                        "image": image+":sha-"+std.substr(tag,0,7),
                        "name": name,
                        "ports": [
                        {
                            "containerPort": containerPort
                        }
                        ]
                    }
                ]
                }
            }
        }
    }
    ]
