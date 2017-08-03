resource "opc_compute_security_protocol" "sec-protocols-1" {
  name        = "access_srv_sec-protocols-1"
  dst_ports   = ["22"]
  ip_protocol = "tcp"
}
resource "opc_compute_security_protocol" "sec-protocols-2" {
  name        = "web_srv_sec-protocols-1"
  dst_ports   = ["80", "443","22"]
  ip_protocol = "tcp"
}
resource "opc_compute_security_protocol" "sec-protocols-3" {
  name        = "app_srv_sec-protocols-1"
  dst_ports   = ["80", "443","22"]
  ip_protocol = "tcp"
}
resource "opc_compute_security_protocol" "sec-protocols-4" {
  name        = "db_srv_sec-protocols-1"
  dst_ports   = ["80", "443","22","3306"]
  ip_protocol = "tcp"
}
