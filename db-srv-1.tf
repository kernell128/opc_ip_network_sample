resource "opc_compute_storage_volume" "db-1_bootvol" {
	size = "50"
	description = "Example bootable storage volume"
		name = "db-1_bootvol"
	bootable = true
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	image_list_entry = 2
}

resource "opc_compute_instance" "db-srv-1" {
		name = "db-srv-1"
		hostname = "db-srv-1"
		networking_info {
	                index = 0
	                ip_network = "${opc_compute_ip_network.db-net.name}"
	                ip_address = "172.10.16.10"
									vnic_sets = ["db_srv_vnicset"]

	  	}
	label = "My Oracle Linux 7.2 UEK3 Server"
	shape = "oc3"
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	ssh_keys = [ "${opc_compute_ssh_key.sshkey2.name}" ]

	storage {
		index = 1
		volume = "${opc_compute_storage_volume.db-1_bootvol.name}"
	}
	boot_order = [ 1 ]
}
resource "opc_compute_ip_address_reservation" "db-srv-1" {
  name            = "db-srv-1"
  ip_address_pool = "public-ippool"
}
resource "opc_compute_ip_address_association" "db-srv-1" {
  name                   = "db-srv-1"
  ip_address_reservation = "${opc_compute_ip_address_reservation.db-srv-1.name}"
  vnic                   = "${opc_compute_instance.db-srv-1.name}/${opc_compute_instance.db-srv-1.id}/eth0"

}
# output "db-srv-1_public_ip" {
#   value = "${opc_compute_ip_address_reservation.db-srv-1.ip}"
# }

resource "null_resource" "db-srv-1_remote-exec" {
    depends_on = ["opc_compute_instance.db-srv-1"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "10m"
        host = "${opc_compute_ip_address_reservation.db-srv-1.ip_address}"
        user = "opc"
        private_key = "${file("/Users/mike/mk_keys_02/id_rsa.priv")}"
    }
      inline = [<<EOF
         sudo yum update -y
         sudo yum install mysql mysql-server php php-common php-mysql -y

        EOF
      ]
    }
}
