variable namespaces {
  type = map(string)
}

resource "kubernetes_namespace" "map-example" {
  for_each = var.namespaces
  metadata {
    name = "map-${each.key}"
  }
}