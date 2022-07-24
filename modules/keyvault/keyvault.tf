data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "az_key_vault" {
  name                            = "${var.prefix}-${var.env}-kvs"
  location                        = var.rg_location
  resource_group_name             = var.rg_name
  sku_name                        = "standard"
  tenant_id                       = data.azurerm_client_config.current.tenant_id
 
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "create",
      "get",
      "list",
    ]

    secret_permissions = [
      "set",
      "get",
      "list",
      "delete",
      "purge",
      "recover"
    ]
  }
}

#Key Vault Secret

resource "azurerm_key_vault_secret" "secrets_ams" {
  name         = "ams-account-name"
  value        = var.media_name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_acr_image" {
  name         = "DEV-ACR-REGISTRY"
  value        = var.DEV-ACR-REGISTRY
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_dbname" {
  name         = "DBNAME"
  value        = var.DBNAME
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_api_name" {
  name         = "ACR-API-Name"
  value        = var.api_name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_api_password" {
  name         = "ACR-API-Password"
  value        = var.api_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}
# resource "azurerm_key_vault_secret" "secrets_ad_user_name" {
#   name         = "Active-Directory-Username"
#   value        = var.ad_user
#   key_vault_id = azurerm_key_vault.az_key_vault.id
# }

# resource "azurerm_key_vault_secret" "secrets_cdn_endpoint_name" {
#   name         = "CDN-Endpoint-Name"
#   value        = var.cdn-endpoint-name
#   key_vault_id = azurerm_key_vault.az_key_vault.id
# }

resource "azurerm_key_vault_secret" "secrets_iot_dps_name" {
  name         = "IOTHUB-DPS-Name"
  value        = var.dps_name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_notification_namespace" {
  name         = "Notificationhub-Namespace"
  value        = var.notify-namespace
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_notification_hub" {
  name         = "Notificationhub-Name"
  value        = var.notify-name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "secrets_static_endpoint" {
  name         = "Static-Website-Endpoint"
  value        = var.endpoint_static_web
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_iot_topic" {
  name         = "IOT-System-Topic-Name"
  value        = var.iot_system_topic
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_iot_namespace" {
  name         = "IOT-Event-Namespace"
  value        = var.iot_event_namespace
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "secrets_iot_eventhubname" {
  name         = "IOT-Eventhub-Name"
  value        = var.iot_eventhub_name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_iot_subscription" {
  name         = "IOT-Event-Subscription"
  value        = var.iot_event_subscription
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


# resource "azurerm_key_vault_secret" "secrets_media_topic" {
#   name         = "Media-System-Topic-Name"
#   value        = var.media_system_topic
#   key_vault_id = azurerm_key_vault.az_key_vault.id
# }

# resource "azurerm_key_vault_secret" "secrets_media_namespace" {
#   name         = "Media-Event-Namespace"
#   value        = var.media_event_namespace
#   key_vault_id = azurerm_key_vault.az_key_vault.id
# }


# resource "azurerm_key_vault_secret" "secrets_media_eventhubname" {
#   name         = "Media-Eventhub-Name"
#   value        = var.media_eventhub_name
#   key_vault_id = azurerm_key_vault.az_key_vault.id
# }

# resource "azurerm_key_vault_secret" "secrets_media_subscription" {
#   name         = "Media-Event-Subscription"
#   value        = var.media_event_subscription
#   key_vault_id = azurerm_key_vault.az_key_vault.id
# }

resource "azurerm_key_vault_secret" "secrets_app_name" {
  name         = "Application-Service-Name"
  value        = var.app-name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

#Hardcoded Values
resource "azurerm_key_vault_secret" "secrets_dupliate_value" {
  name         = "check-duplicate-video"
  value        = "False"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_checkpoint" {
  name         = "checkpoint-dir"
  value        = "/mnt/resource/checkpoint"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_workflow_image" {
  name         = "CONTAINER-WORKFLOW-IMAGE"
  value        = "activsurgical.azurecr.io/algorithms/container-workflow:v1.82"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_dbengine" {
  name         = "DBENGINE"
  value        = "django.db.backends.mysql"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_dbport" {
  name         = "DBPORT"
  value        = "3306"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_deltainseconds" {
  name         = "delta-in-seconds"
  value        = "10"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_djangokey" {
  name         = "DJANGO-SECRET-KEY"
  value        = "n#9chsjuokm$muhe4se(&3%!=@u&xk47vtja(8-_c(9w$qp(@("
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_emailbackend" {
  name         = "EMAIL-BACKEND"
  value        = "sendgrid_backend.SendgridBackend"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_emailhost" {
  name         = "EMAIL-HOST"
  value        = "smtp.sendgrid.net"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_emailport" {
  name         = "EMAIL-PORT"
  value        = "465"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_emailssl" {
  name         = "EMAIL-USE-SSL"
  value        = "True"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_ifusion_mount_path" {
  name         = "IFUSION-MOUNT-PATH"
  value        = "/home/activifusiondev/blobmount"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_procinterval" {
  name         = "MIN-PROCEDURE-INTERVAL"
  value        = "1800"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_iterations" {
  name         = "num-iterations-streaming-endpoint"
  value        = "5"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_prefusion" {
  name         = "perfusion-output-dir"
  value        = "/mnt/resource/perfusion"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_qadbengine" {
  name         = "QA-DBENGINE"
  value        = "django.db.backends.mysql"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_qadbport" {
  name         = "QA-DBPORT"
  value        = "3306"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_videometadata" {
  name         = "VIDEO-METADATA-CONTAINER-IMAGE"
  value        = "activsurgical.azurecr.io/algorithms/video-metadata-extractor:v1.1"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "secrets_videoalgo" {
  name         = "VIDEODATASET-MAPPING-ALGORITHM-FILEPATH"
  value        = "developer/videodataset/mapping/aglorithm.json"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "iot_hubs" {
  name         = "iot-hubs"
  value        = var.iot-hubs
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "kaad" {
  name         = "kaad"
  value        = "496e6e6f6d696e6473323238343835333333446576696365"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "allowed_video_formats" {
  name         = "allowed-video-formats"
  value        = "mp4,avi,mpeg"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "dbhost" {
  name         = "DBHOST"
  value        = var.DBHOST
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "adminuser" {
  name         = "DBUSER"
  value        = var.admin_username
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "adminpassword" {
  name         = "DBPASSWORD"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "AD-client-id" {
  name         = "AD-client-id"
  value        = var.AD-CLIENT-ID
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "AD-client-secret" {
  name         = "AD-client-secret"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "AD-scope" {
  name         = "AD-scope"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "AD-tenant-id" {
  name         = "AD-tenant-id"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "admin-email" {
  name         = "admin-email"
  value        = var.admin-email
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "admin-password" {
  name         = "admin-password"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ams-accont-name" {
  name         = "ams-accont-name"
  value        = var.ams-account-name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ams-client-id" {
  name         = "ams-client-id"
  value        = var.ams-client-id
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

# TBD
resource "azurerm_key_vault_secret" "ams-client-secret" {
  name         = "ams-client-secret"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ams-resource-group-name" {
  name         = "ams-resource-group-name"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "ams-subscription-id" {
  name         = "ams-subscription-id"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ams-tenant-id" {
  name         = "ams-tenant-id"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "azure-acc-name" {
  name         = "azure-acc-name"
  value        = var.azure-acc-name
  key_vault_id = azurerm_key_vault.az_key_vault.id
}


resource "azurerm_key_vault_secret" "azure-container" {
  name         = "azure-container"
  value        = var.azure-container
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "azure-container-logs" {
  name         = "azure-container-logs"
  value        = var.azure-container-logs
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "azure-primary-key" {
  name         = "azure-primary-key"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "azure-processedvideos-container" {
  name         = "azure-processedvideos-container"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DATALOOP-PASSWORD" {
  name         = "DATALOOP-PASSWORD"
  value        = "Saru@dataloop1421"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DATALOOP-PROJECT" {
  name         = "DATALOOP-PROJECT"
  value        = "iFusion"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DATALOOP-USERNAME" {
  name         = "DATALOOP-USERNAME"
  value        = "smamidala@innominds.com"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEFAULT-FROM-EMAIL" {
  name         = "DEFAULT-FROM-EMAIL"
  value        = "skada@innominds.com"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEV-ACR-CREDENTIALS" {
  name         = "DEV-ACR-CREDENTIALS"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEV-CDN-URL" {
  name         = "DEV-CDN-URL"
  value        = "https://c877ea4d21b34c67bece5adc42b7cc17.azureedge.net"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEV-ES-DEVICE-INDEX" {
  name         = "DEV-ES-DEVICE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEV-ES-LOCATION-INDEX" {
  name         = "DEV-ES-LOCATION-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEV-ES-PROCEDURE-INDEX" {
  name         = "DEV-ES-PROCEDURE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEVELOPER-CONTAINER" {
  name         = "DEVELOPER-CONTAINER"
  value        = var.DEVELOPER-CONTAINER
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEVICE-DISK-SPACE-BYTES" {
  name         = "DEVICE-DISK-SPACE-BYTES"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DEVICE-LOGS-CONTAINER" {
  name         = "DEVICE-DISK-SPACE-BYTES"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "DJANGO-SECRET-KEY" {
  name         = "DJANGO-SECRET-KEY"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "dps-connection-string" {
  name         = "dps-connection-string"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-ALGORITHM-STATUS-URL" {
  name         = "EDGE-ALGORITHM-STATUS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-BUSINESS-OUTPUTS-URL" {
  name         = "EDGE-BUSINESS-OUTPUTS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-DEVICE-LOG-URL" {
  name         = "EDGE-DEVICE-LOG-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-DEVICES-INFO-URL" {
  name         = "EDGE-DEVICES-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-LOGIN-PASSWORD" {
  name         = "EDGE-LOGIN-PASSWORD"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-LOGIN-URL" {
  name         = "EDGE-LOGIN-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-LOGIN-USERNAME" {
  name         = "EDGE-LOGIN-USERNAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-METADATA-URL" {
  name         = "EDGE-METADATA-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-PROCEDURE-INFO-URL" {
  name         = "EDGE-PROCEDURE-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-PROCESS-STATUS-URL" {
  name         = "EDGE-PROCESS-STATUS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-STATUS-UPDATE-URL" {
  name         = "EDGE-STATUS-UPDATE-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EDGE-VIDEO-METADATA-INFO-URL" {
  name         = "EDGE-VIDEO-METADATA-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ELASTIC-SEARCH-API-KEY" {
  name         = "ELASTIC-SEARCH-API-KEY"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ELASTIC-SEARCH-ENCODED" {
  name         = "ELASTIC-SEARCH-ENCODED"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ELASTIC-SEARCH-ID" {
  name         = "ELASTIC-SEARCH-ID"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ELASTIC-SEARCH-NAME" {
  name         = "ELASTIC-SEARCH-ID"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ELASTIC-SEARCH-URL" {
  name         = "ELASTIC-SEARCH-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ELASTICSEARCH-DEVICE-INDEX" {
  name         = "ELASTICSEARCH-DEVICE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "ELASTICSEARCH-PROCEDURE-INDEX" {
  name         = "ELASTICSEARCH-PROCEDURE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EMAIL-BACKEND" {
  name         = "EMAIL-BACKEND"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EMAIL-HOST" {
  name         = "EMAIL-HOST"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EMAIL-HOST-USER" {
  name         = "EMAIL-HOST-USER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EMAIL-PORT" {
  name         = "EMAIL-PORT"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "EMAIL-USE-SSL" {
  name         = "EMAIL-PORT"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "GRPC-TRITON-SERVER-SERVICE" {
  name         = "GRPC-TRITON-SERVER-SERVICE"
  value        = "triton-server-grpc-service:81"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "HOME-DIRECTORY" {
  name         = "HOME-DIRECTORY"
  value        = "/home/appuser/container"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "HOSPITAL-ADMIN-ROLE" {
  name         = "HOSPITAL-ADMIN-ROLE"
  value        = "6052eeb6-2e0e-495e-9abc-1e7acf37ee3b"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "HTTPS-TRITON-SERVER-SERVICE" {
  name         = "HTTPS-TRITON-SERVER-SERVICE"
  value        = "triton-server-service:80"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "icg-output-dir" {
  name         = "icg-output-dir"
  value        = "/mnt/resource/icg"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "IFUSION-MOUNT-PATH" {
  name         = "IFUSION-MOUNT-PATH"
  value        = "/home/activifusiondev/blobmount"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "IFUSION-SERVER-IP" {
  name         = "IFUSION-SERVER-IP"
  value        = "https://40.114.125.191:8444"
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "IFUSION-SERVER-IP" {
  name         = "IFUSION-SERVER-IP"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "IOTHUB-CONNECTION-STRING" {
  name         = "IOTHUB-CONNECTION-STRING"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "IOTHUB-CONNECTION-STRING-QA" {
  name         = "IOTHUB-CONNECTION-STRING-QA"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "K8S-CPU-NODEPOOL" {
  name         = "K8S-CPU-NODEPOOL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "K8S-IMAGE-PULL-SECRETS" {
  name         = "K8S-IMAGE-PULL-SECRETS"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "K8S-NAMESPACE" {
  name         = "K8S-NAMESPACE"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "K8S-NODEPOOL" {
  name         = "K8S-NODEPOOL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "K8S-PVC-CLAIM-DEVICE" {
  name         = "K8S-PVC-CLAIM-DEVICE"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "K8S-PVC-CLAIM-PROCESSED" {
  name         = "K8S-PVC-CLAIM-PROCESSED"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "K8S-PVC-CLAIM-RAWVIDEO" {
  name         = "K8S-PVC-CLAIM-RAWVIDEO"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "LOGS-CONTAINER" {
  name         = "LOGS-CONTAINER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "LOGS-DOCKER-IMAGE" {
  name         = "LOGS-DOCKER-IMAGE"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "MIN-PROCEDURE-INTERVAL" {
  name         = "MIN-PROCEDURE-INTERVAL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "mvpapi34d030fd-19d6-47b9-a37d-903b47d6f262" {
  name         = "mvpapi34d030fd-19d6-47b9-a37d-903b47d6f262"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "num-iterations-streaming-endpoint" {
  name         = "num-iterations-streaming-endpoint"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "perfusion-output-dir" {
  name         = "perfusion-output-dir"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "PUSHER-APP-ID" {
  name         = "PUSHER-APP-ID"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "PUSHER-CLUSTER" {
  name         = "PUSHER-CLUSTER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "PUSHER-KEY" {
  name         = "PUSHER-KEY"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "PUSHER-SECRET-KEY" {
  name         = "PUSHER-SECRET-KEY"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-ACR-CREDENTIALS" {
  name         = "QA-ACR-CREDENTIALS"
  value        = var.QA-ACR-CREDENTIALS
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-ACR-REGISTRY" {
  name         = "QA-ACR-REGISTRY"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-CDN-URL" {
  name         = "QA-CDN-URL"
  value        = var.QA-CDN-URL
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-CONTAINER-WORKFLOW-IMAGE" {
  name         = "QA-CONTAINER-WORKFLOW-IMAGE"
  value        = var.QA-CONTAINER-WORKFLOW-IMAGE
  key_vault_id = "activsurgical.azurecr.io/algorithms/container-workflow:v1.82"
}

resource "azurerm_key_vault_secret" "QA-DBENGINE" {
  name         = "QA-DBENGINE"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-DBHOST" {
  name         = "QA-DBHOST"
  value        = var.QA-DBHOST
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-DBNAME" {
  name         = "QA-DBNAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-DBPASSWORD" {
  name         = "QA-DBPASSWORD"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-DBPORT" {
  name         = "QA-DBPASSWORD"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-DBUSER" {
  name         = "QA-DBUSER"
  value        = var.QA-DBUSER        
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-ALGORITHM-STATUS-URL" {
  name         = "QA-EDGE-ALGORITHM-STATUS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-BUSINESS-OUTPUTS-URL" {
  name         = "QA-EDGE-BUSINESS-OUTPUTS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-DEVICE-LOG-URL" {
  name         = "QA-EDGE-DEVICE-LOG-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-DEVICES-INFO-URL" {
  name         = "QA-EDGE-DEVICES-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-LOGIN-PASSWORD" {
  name         = "QA-EDGE-LOGIN-PASSWORD"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-LOGIN-URL" {
  name         = "QA-EDGE-LOGIN-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-LOGIN-USERNAME" {
  name         = "QA-EDGE-LOGIN-USERNAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-METADATA-URL" {
  name         = "QA-EDGE-METADATA-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-PROCEDURE-INFO-URL" {
  name         = "QA-EDGE-PROCEDURE-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-PROCESS-STATUS-URL" {
  name         = "QA-EDGE-PROCESS-STATUS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-PROCESS-STATUS-URL" {
  name         = "QA-EDGE-PROCESS-STATUS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-STATUS-UPDATE-URL" {
  name         = "QA-EDGE-STATUS-UPDATE-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-EDGE-VIDEO-METADATA-INFO-URL" {
  name         = "QA-EDGE-VIDEO-METADATA-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-ELASTICSEARCH-DEVICE-INDEX" {
  name         = "QA-ELASTICSEARCH-DEVICE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-ELASTICSEARCH-PROCEDURE-INDEX" {
  name         = "QA-ELASTICSEARCH-PROCEDURE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-ES-DEVICE-INDEX" {
  name         = "QA-ES-DEVICE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-ES-LOCATION-INDEX" {
  name         = "QA-ES-LOCATION-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-ES-PROCEDURE-INDEX" {
  name         = "QA-ES-PROCEDURE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-IFUSION-MOUNT-PATH" {
  name         = "QA-IFUSION-MOUNT-PATH"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-IFUSION-SERVER-IP" {
  name         = "QA-IFUSION-SERVER-IP"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-IOTHUB-CONNECTION-STRING" {
  name         = "QA-IOTHUB-CONNECTION-STRING"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-SERVICE-BUS-CONNECTION-STRING" {
  name         = "QA-SERVICE-BUS-CONNECTION-STRING"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-SERVICE-BUS-SUBSCRIPTION-NAME" {
  name         = "QA-SERVICE-BUS-SUBSCRIPTION-NAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "QA-SERVICE-BUS-TOPIC-NAME" {
  name         = "QA-SERVICE-BUS-TOPIC-NAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "send-email-notification" {
  name         = "send-email-notification"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "SENDGRID-SANDBOX-MODE-IN-DEBUG" {
  name         = "SENDGRID-SANDBOX-MODE-IN-DEBUG"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "SENDGRID-SECRET-KEY" {
  name         = "SENDGRID-SECRET-KEY"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "SERVICE-BUS-CONNECTION-STRING" {
  name         = "SERVICE-BUS-CONNECTION-STRING"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "SERVICE-BUS-SUBSCRIPTION-NAME" {
  name         = "SERVICE-BUS-SUBSCRIPTION-NAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "SERVICE-BUS-TOPIC-NAME" {
  name         = "SERVICE-BUS-TOPIC-NAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-AZURE-CONTAINER" {
  name         = "STAGING-AZURE-CONTAINER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-AZURE-CONTAINER-LOGS" {
  name         = "STAGING-AZURE-CONTAINER-LOGS"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-AZURE-PROCESSEDVIDEOS-CONTAINER" {
  name         = "STAGING-AZURE-PROCESSEDVIDEOS-CONTAINER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-DBNAME" {
  name         = "STAGING-DBNAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-DBPASSWORD" {
  name         = "STAGING-DBPASSWORD"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-DBUSER" {
  name         = "STAGING-DBUSER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-DEVELOPER-CONTAINER" {
  name         = "STAGING-DEVELOPER-CONTAINER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-DEVICE-LOGS-CONTAINER" {
  name         = "STAGING-DEVICE-LOGS-CONTAINER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-ALGORITHM-STATUS-URL" {
  name         = "STAGING-EDGE-ALGORITHM-STATUS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-BUSINESS-OUTPUTS-URL" {
  name         = "STAGING-EDGE-BUSINESS-OUTPUTS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-DEVICE-LOG-URL" {
  name         = "STAGING-EDGE-DEVICE-LOG-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-DEVICES-INFO-URL" {
  name         = "STAGING-EDGE-DEVICES-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-LOGIN-PASSWORD" {
  name         = "STAGING-EDGE-LOGIN-PASSWORD"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-LOGIN-URL" {
  name         = "STAGING-EDGE-LOGIN-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-LOGIN-USERNAME" {
  name         = "STAGING-EDGE-LOGIN-USERNAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-METADATA-URL" {
  name         = "STAGING-EDGE-METADATA-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-PROCEDURE-INFO-URL" {
  name         = "STAGING-EDGE-PROCEDURE-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-PROCESS-STATUS-URL" {
  name         = "STAGING-EDGE-PROCESS-STATUS-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-STATUS-UPDATE-URL" {
  name         = "STAGING-EDGE-STATUS-UPDATE-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-EDGE-VIDEO-METADATA-INFO-URL" {
  name         = "STAGING-EDGE-VIDEO-METADATA-INFO-URL"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-ES-DEVICE-INDEX" {
  name         = "STAGING-ES-DEVICE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-ES-LOCATION-INDEX" {
  name         = "STAGING-ES-LOCATION-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-ES-PROCEDURE-INDEX" {
  name         = "STAGING-ES-PROCEDURE-INDEX"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-LOGS-CONTAINER" {
  name         = "STAGING-LOGS-CONTAINER"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-SEND-EMAIL-NOTIFICATION" {
  name         = "STAGING-SEND-EMAIL-NOTIFICATION"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-SERVICE-BUS-CONNECTION-STRING" {
  name         = "STAGING-SERVICE-BUS-CONNECTION-STRING"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "STAGING-SERVICE-BUS-TOPIC-NAME" {
  name         = "STAGING-SERVICE-BUS-TOPIC-NAME"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "storage-connection-string" {
  name         = "storage-connection-string"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "USER-PRINCIPAL-NAME-DOMAIN" {
  name         = "USER-PRINCIPAL-NAME-DOMAIN"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}

resource "azurerm_key_vault_secret" "VIDEO-METADATA-CONTAINER-IMAGE" {
  name         = "VIDEO-METADATA-CONTAINER-IMAGE"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}
#todo
resource "azurerm_key_vault_secret" "VIDEODATASET-MAPPING-ALGORITHM-FILEPATH" {
  name         = "VIDEODATASET-MAPPING-ALGORITHM-FILEPATH"
  value        = var.admin_password
  key_vault_id = azurerm_key_vault.az_key_vault.id
}