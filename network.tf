resource "opc_compute_ip_network_exchange" "ip-network-exchange" {
  name = "IP_Exchange_Environment_1"
  description = "IP_Exchange_Environment_1"
}

resource "opc_compute_ip_network" "lb-net" {
  name = "lb-net"
  description = "LB-NET"
  ip_address_prefix = "172.10.10.0/24"
  ip_network_exchange = "${opc_compute_ip_network_exchange.ip-network-exchange.name}"
}

resource "opc_compute_ip_network" "web-net" {
  name = "web-net"
  description = "WEB-NET"
  ip_address_prefix = "172.10.12.0/24"
  ip_network_exchange = "${opc_compute_ip_network_exchange.ip-network-exchange.name}"
}

resource "opc_compute_ip_network" "app-net" {
  name = "app-net"
  description = "VIP-APP"
  ip_address_prefix = "172.10.14.0/24"
  ip_network_exchange = "${opc_compute_ip_network_exchange.ip-network-exchange.name}"
}

resource "opc_compute_ip_network" "acc-net" {
  name = "acc-net"
  description = "ACC-NET"
  ip_address_prefix = "172.10.0.0/24"
  ip_network_exchange = "${opc_compute_ip_network_exchange.ip-network-exchange.name}"
}
resource "opc_compute_ip_network" "db-net" {
  name = "db-net"
  description = "DB-NET"
  ip_address_prefix = "172.10.16.0/24"
  ip_network_exchange = "${opc_compute_ip_network_exchange.ip-network-exchange.name}"
}
