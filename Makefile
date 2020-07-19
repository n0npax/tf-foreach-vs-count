clean:
	terraform destroy -auto-approve -state=list.tfstate -var-file list/list1.tfvars list
	terraform destroy -auto-approve -state=set.tfstate -var-file list/list1.tfvars set
	terraform destroy -auto-approve -state=map.tfstate -var-file map/map1.tfvars map

init:
	terraform $@ list
	terraform $@ map
	terraform $@ set

list1 list2:
	terraform apply -auto-approve -var-file list/$@.tfvars -state=list.tfstate list

set1:
	terraform apply -auto-approve -var-file list/list1.tfvars -state=set.tfstate set

set2:
	terraform apply -auto-approve -var-file list/list2.tfvars -state=set.tfstate set

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

.PHONY: set
set:
	$(MAKE) set1
	$(MAKE) set2
	@echo "only 1 resource was recreated. Code is very simillar to list"