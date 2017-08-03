resource "opc_compute_acl" "access_srv_acl-1" {
  name        = "access_srv_acl-1"
  description = "ACL-1: Access Servers"
  tags        = ["SSH", "Access"]
}
resource "opc_compute_acl" "app_srv_acl-1" {
  name        = "app_srv_acl-1"
  description = "ACL-1: App Servers"
  tags        = ["SSH", "APP"]
}
resource "opc_compute_acl" "web_srv_acl-1" {
  name        = "web_srv_acl-1"
  description = "ACL-1: Web Servers"
  tags        = ["HTTP/HTTPS", "WEB"]
}
resource "opc_compute_acl" "db_srv_acl-1" {
  name        = "db_srv_acl-1"
  description = "ACL-1: DB Servers"
  tags        = ["HTTP/HTTPS", "DB"]
}
