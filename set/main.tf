variable namespaces {
  type = list
}

resource "kubernetes_namespace" "set-example" {
  for_each = toset(var.namespaces)
  metadata {
    name = "set-${each.value}"
  }
}
