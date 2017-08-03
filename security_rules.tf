# Ingress Block
resource "opc_compute_security_rule" "secrule-1" {
  name               = "secrule-1"
  flow_direction     = "ingress"
  dst_vnic_set       = "${opc_compute_vnic_set.access_srv_vnicset.name}"
  acl                = "${opc_compute_acl.access_srv_acl-1.name}"
  security_protocols = ["${opc_compute_security_protocol.sec-protocols-1.name}"]
}
resource "opc_compute_security_rule" "secrule-2" {
  name               = "secrule-2"
  flow_direction     = "ingress"
  dst_vnic_set       = "${opc_compute_vnic_set.web_srv_vnicset.name}"
  acl                = "${opc_compute_acl.web_srv_acl-1.name}"
  security_protocols = ["${opc_compute_security_protocol.sec-protocols-2.name}"]
}
resource "opc_compute_security_rule" "secrule-3" {
  name               = "secrule-3"
  flow_direction     = "ingress"
  dst_vnic_set       = "${opc_compute_vnic_set.app_srv_vnicset.name}"
  acl                = "${opc_compute_acl.app_srv_acl-1.name}"
  security_protocols = ["${opc_compute_security_protocol.sec-protocols-3.name}"]
}
resource "opc_compute_security_rule" "secrule-4" {
  name               = "secrule-4"
  flow_direction     = "ingress"
  dst_vnic_set       = "${opc_compute_vnic_set.db_srv_vnicset.name}"
  acl                = "${opc_compute_acl.db_srv_acl-1.name}"
  security_protocols = ["${opc_compute_security_protocol.sec-protocols-4.name}"]
}
# Egress Block
resource "opc_compute_security_rule" "egress-access" {
  name               = "egress-access"
  flow_direction     = "egress"
  acl                = "${opc_compute_acl.access_srv_acl-1.name}"
}
resource "opc_compute_security_rule" "egress-web" {
  name               = "egress-web"
  flow_direction     = "egress"
  acl                = "${opc_compute_acl.web_srv_acl-1.name}"
}
resource "opc_compute_security_rule" "egress-app" {
  name               = "egress-app"
  flow_direction     = "egress"
  acl                = "${opc_compute_acl.app_srv_acl-1.name}"
}
resource "opc_compute_security_rule" "egress-db" {
  name               = "egress-db"
  flow_direction     = "egress"
  acl                = "${opc_compute_acl.db_srv_acl-1.name}"
}
