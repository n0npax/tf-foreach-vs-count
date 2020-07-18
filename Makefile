clean:
	terraform destroy -auto-approve -var-file list/list1.tfvars list
	terraform destroy -auto-approve -var-file map/map1.tfvars map

init:
	terraform $@ list
	terraform $@ map

list1 list2:
	terraform apply -auto-approve -var-file list/$@.tfvars -state=list.tfstate list

map1 map2:
	terraform apply -auto-approve -var-file map/$@.tfvars -state=map.tfstate map

.PHONY: list
list:
	$(MAKE) list1
	$(MAKE) list2
	@echo "everything was recreated"

.PHONY: map
map:
	$(MAKE) map1
	$(MAKE) map2
	@echo "only 1 resource was recreated"