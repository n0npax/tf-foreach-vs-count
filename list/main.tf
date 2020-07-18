variable namespaces {
  type = list
}

resource "kubernetes_namespace" "list-example" {
  count = length(var.namespaces)
  metadata {
    name = "list-${var.namespaces[count.index]}"
  }
}
