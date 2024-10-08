install_kyverno:
	chmod +x ./kyverno/setup_kyverno.sh
	./kyverno/setup_kyverno.sh
setup_namespace:
	chmod +x ./setup_namespace.sh
	./setup_namespace.sh
create_deployment_file:
	chmod +x ./create_simple_nginx_deployment_file.sh
        ./create_simple_nginx_deployment_file.sh
apply:
	kubectl apply -f nginx-deployment.yaml
delete:
	kubectl delete -f nginx-deployment.yaml
apply_patch:
	kubectl apply -f nginx-deployment-patched.yaml
activate_disallow_root:
	kubectl apply -f kyverno/sample_policies/disallow-root.yaml
deactivate_disallow_root:
	kubectl delete -f kyverno/sample_policies/disallow-root.yaml
patch_disallow_root:
	kubectl patch -f nginx-deployment.yaml --type='merge' -p '{"spec":{"template":{"spec":{"securityContext":{"runAsNonRoot":true}}}}}' --dry-run=client -o yaml > nginx-deployment-patched.yaml