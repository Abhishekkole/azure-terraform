resource_group_name = "uat-tenant"
location            = "South Central US"
cluster_name        = "uat-tenant"
kubernetes_version  = "1.22.6"
system_node_count   = 5
postgre_sql_name    = "uattenantserver"
admin_username      = "tenant"
admin_password      = "Tenant1234"
db1_name            = "user_mgmt"
db2_name            = "tenant-db"
storage-account-name = "uattenantblob"
container-name      = "receiver"