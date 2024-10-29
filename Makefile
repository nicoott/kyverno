1_install_kyverno:
	chmod +x ./kyverno/setup_kyverno.sh
	./kyverno/setup_kyverno.sh
2_setup_namespace:
	chmod +x ./setup_namespace.sh
	./setup_namespace.sh
3_create_deployment_file:
	chmod +x ./create_simple_nginx_deployment_file.sh
	./create_simple_nginx_deployment_file.sh
4_apply:
	kubectl apply -f nginx-deployment.yaml
5_delete:
	kubectl delete -f nginx-deployment.yaml

6_activate_disallow_root:
	kubectl apply -f kyverno/sample_policies/disallow-root.yaml
7_patch_disallow_root:
	kubectl patch -f nginx-deployment.yaml --type='merge' -p '{"spec":{"template":{"spec":{"securityContext":{"runAsNonRoot":true}}}}}' --dry-run=client -o yaml > nginx-deployment-patched.yaml
8_apply_patch:
	kubectl apply -f nginx-deployment-patched.yaml
9_deactivate_disallow_root:
	kubectl delete -f kyverno/sample_policies/disallow-root.yaml
