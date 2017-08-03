resource "opc_compute_ssh_key" "sshkey2" {
  name = "IPNetwork_SSH_KEY"
  key = "${file(var.ssh_public_key_file)}"
  enabled = true
}
