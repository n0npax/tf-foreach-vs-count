# Difference between tfstates when using count and for_each

Please comare tfstate when same resource was created using `for_each`(map) and `count`(list) keyword

## Removing resource
As you can see, when removing 1st item from the list:

When using map, there was no recreation
```bash
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
Apply complete! Resources: 0 added, 0 changed, 1 destroyed.
```

When using list, recreation was required to fix resource ordering in tf state
```bash
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
Apply complete! Resources: 2 added, 0 changed, 3 destroyed.
```

## State

### list
```
 {
          "index_key": 1,
          "schema_version": 0,
          "attributes": {
```

### map
```
    {
          "index_key": "foo",
          "schema_version": 0,
          "attributes": {
```

## Test it yourself
```
# ensure you have direct access to kubernetes cluster
# you can use minikube for test purposes
make init
make list
make map
# compare states
make clean
```