resource "opc_compute_storage_volume" "app-1_bootvol" {
	size = "50"
	description = "Example bootable storage volume"
		name = "app-1_bootvol"
	bootable = true
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	image_list_entry = 2
}

resource "opc_compute_instance" "app-srv-1" {
		name = "app-srv-1"
		hostname = "app-srv-1"
		networking_info {
	                index = 0
	                ip_network = "${opc_compute_ip_network.app-net.name}"
	                ip_address = "172.10.14.10"
									vnic_sets = ["app_srv_vnicset"]

	  	}
	label = "My Oracle Linux 7.2 UEK3 Server"
	shape = "oc3"
	image_list = "/oracle/public/OL_7.2_UEKR3_x86_64"
	ssh_keys = [ "${opc_compute_ssh_key.sshkey2.name}" ]

	storage {
		index = 1
		volume = "${opc_compute_storage_volume.app-1_bootvol.name}"
	}
	boot_order = [ 1 ]
}
resource "opc_compute_ip_address_reservation" "app-srv-1" {
  name            = "app-srv-1"
  ip_address_pool = "public-ippool"
}
resource "opc_compute_ip_address_association" "app-srv-1" {
  name                   = "app-srv-1"
  ip_address_reservation = "${opc_compute_ip_address_reservation.app-srv-1.name}"
  vnic                   = "${opc_compute_instance.app-srv-1.name}/${opc_compute_instance.app-srv-1.id}/eth0"

}
# output "app-srv-1_public_ip" {
#   value = "${opc_compute_ip_address_reservation.app-srv-1.ip}"
# }

resource "null_resource" "app-srv-1_remote-exec" {
    depends_on = ["opc_compute_instance.app-srv-1"]
    provisioner "remote-exec" {
      connection {
        agent = false
        timeout = "10m"
        host = "${opc_compute_ip_address_reservation.app-srv-1.ip_address}"
        user = "opc"
        private_key = "${file("/Users/mike/mk_keys_02/id_rsa.priv")}"
    }
      inline = [<<EOF
         sudo yum update -y
				 sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
         sudo yum install nginx php php-common php-mysql mysql -y
				 sudo systemctl enable nginx
				 sudo service nginx start

        EOF
      ]
    }
}
