resource "opc_compute_vnic_set" "access_srv_vnicset" {
  name         = "access_srv_vnicset"
  description  = "Access_SRV_VnicSet"
  applied_acls = ["access_srv_acl-1"]
  tags         = ["access_srv"]
}
resource "opc_compute_vnic_set" "web_srv_vnicset" {
  name         = "web_srv_vnicset"
  description  = "Web_SRV_VnicSet"
  applied_acls = ["web_srv_acl-1"]
  tags         = ["web_srv"]
}
resource "opc_compute_vnic_set" "app_srv_vnicset" {
  name         = "app_srv_vnicset"
  description  = "App_SRV_VnicSet"
  applied_acls = ["app_srv_acl-1"]
  tags         = ["app_srv"]
}
resource "opc_compute_vnic_set" "db_srv_vnicset" {
  name         = "db_srv_vnicset"
  description  = "DB_SRV_VnicSet"
  applied_acls = ["db_srv_acl-1"]
  tags         = ["db_srv"]
}
