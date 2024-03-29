
# Using Ollama UBI as internal k8s service
https://github.com/williamcaban/ollama-ubi

## with Ollama UBI pod, pull the required model
### This command will download the mistral model for ollama to use

~~~
$ ollama pull mistral
~~~

### This command will run mistral at http://localhost:11434/v1

~~~
ollama run mistral
~~~

# Build chat image

~~~
$ podman build -f Containerfile -t quay.io/rhn_support_arolivei/chat
~~~

# deploy on k8s/microshift/openshift

~~~
oc apply -f manifests/02-chat-serve-deployment.yaml
oc apply -f manifests/03-chat-svc.yaml
oc apply -f manifests/04-chat-route.yaml
~~~
