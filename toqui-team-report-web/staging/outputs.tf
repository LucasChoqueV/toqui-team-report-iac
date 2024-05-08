output "trw_instances_kp_private_key_pem" {
  value = module.trw_instances_kp.private_key_pem
  sensitive = true
}

output "trw_instances_kp_public_key_pem" {
  value = module.trw_instances_kp.public_key_pem
  sensitive = true
}