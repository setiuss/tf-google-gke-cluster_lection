# output "node_ip" {
#   value = [for node in data.google_compute_instance.nodes : node.network_interface[0].access_config[0].nat_ip]
# }

output "kubeconfig" {
  value       = "${path.module}/kubeconfig"
  description = "The path to the kubeconfig file"
}