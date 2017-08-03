
resource "opc_compute_storage_volume" "acc-1_bootvol" {
	size = "50"
	description = "Example bootable storage volume"
		name = "acc-1_bootvol"
	bootable = true
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	image_list_entry = 2
}

resource "opc_compute_instance" "acc-srv-1" {
		name = "acc-srv-1"
		hostname = "acc-srv-1"
		networking_info {
	                index = 0
	                ip_network = "${opc_compute_ip_network.acc-net.name}"
	                ip_address = "172.10.0.10"
									vnic_sets = ["access_srv_vnicset"]

	  	}
	label = "My Oracle Linux 7.2 UEK3 Server"
	shape = "oc3"
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	ssh_keys = [ "${opc_compute_ssh_key.sshkey2.name}" ]

	storage {
		index = 1
		volume = "${opc_compute_storage_volume.acc-1_bootvol.name}"
	}
	boot_order = [ 1 ]
}
resource "opc_compute_ip_address_reservation" "acc-srv-1" {
  name            = "acc-srv-1"
  ip_address_pool = "public-ippool"
}
resource "opc_compute_ip_address_association" "acc-srv-1" {
  name                   = "acc-srv-1"
  ip_address_reservation = "${opc_compute_ip_address_reservation.acc-srv-1.name}"
  vnic                   = "${opc_compute_instance.acc-srv-1.name}/${opc_compute_instance.acc-srv-1.id}/eth0"

}

# output "acc-srv-1_public_ip" {
#   value = "${opc_compute_ip_address_reservation.acc-srv-1_reserv1.ip}"
# }
