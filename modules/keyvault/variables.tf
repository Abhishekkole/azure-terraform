variable "prefix" {
  type        = string
  description = "Prefix for the resource."
}

variable "env" {
  type        = string
  description = "Environment for the resource."
}
variable "rg_name" {
  description = "Name of resource group to deploy resources in."
  type        = string
  default     = ""
}

variable "rg_location" {
  description = "Azure location where resources should be deployed."
  type        = string
  default     = ""
}

variable "rg_tags" {
  description = "Azure resource tags."
  type        = map(string)
  # default     = ""
}

variable "media_name" {
  type = string
  description="Name of the Media"
  default=""
}

variable "DEV-ACR-REGISTRY" {
  type       = string
  description = "Login server name of ACR Image"
  default     = ""
}

variable "login_server-1" {
  type       = string
  description = "Login server name of API Image"
  default     = ""
}

variable "DBNAME" {
  type       = string
  description = "Database name"
  default     = ""

}

# variable "cluster_name" {
#   type        = string
#   description = "Kubernetes Cluster Name"
#   default     = ""
# }

variable "api_name" {
  type = string
  description = "Name of ACR API Name"
  default = ""
}

variable "api_password" {
  type = string
  description = "Password of ACR API Name"
  default = ""
}


# variable "ad_user" {
#   type = string
#   description = "Name of Active Directory User Name"
#   default = ""
# }

# variable "cdn-endpoint-name" {
#   type = string
#   description = "Name of CDN Endpoint"
#   default = ""
# }

variable "dps_name" {
  type = string
  description = "Name of IOTHUB DPS"
  default = ""
}

variable "notify-namespace" {
  type = string
  description = "Name of Notificationhub Namespace"
  default = ""
}

variable "notify-name" {
  type = string
  description = "Name of Notificationhub name"
  default = ""
}

variable "endpoint_static_web" {
  type = string
  description = "Endpoint of the static website"
  default = ""
}

variable "iot_system_topic" {
  type = string
  description = "Name of IOT System Topic"
  default = ""
}

variable "iot_event_namespace" {
  type = string
  description = "Name of Iothub Event Namespace"
  default = ""
}

variable "iot_eventhub_name" {
  type = string
  description = "Name of IOT EventHub"
  default = ""
}

variable "iot_event_subscription" {
  type = string
  description = "Name of the iot event subscription"
  default = ""
}

# variable "media_system_topic" {
#   type = string
#   description = "Name of Media System Topic"
#   default = ""
# }

# variable "media_event_namespace" {
#   type = string
#   description = "Name of Media Event Namespace"
#   default = ""
# }

# variable "media_eventhub_name" {
#   type = string
#   description = "Name of Media EventHub"
#   default = ""
# }

# variable "media_event_subscription" {
#   type = string
#   description = "Name of media event subscription"
#   default = ""
# }

variable "app-name" {
  type = string
  description = "Name of Application Service"
  default = ""

}


variable "key_vault_secret_name" {
  description = "Name for key vault secret"
  default=""
}

variable "key_vault_secret_value" {
  description = "Value for key vault secret"
  default=""
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU used for the Key Vault. The options are: `standard`, `premium`."
  default     = "standard"
}

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault"
  default     = "ddad250e-0737-4299-93e6-e9a9630e6a4a" #Please paste your tenant id in the double quotes
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Allow Virtual Machines to retrieve certificates stored as secrets from the key vault."
  default     = null
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Allow Disk Encryption to retrieve secrets from the vault and unwrap keys."
  default     = null
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Allow Resource Manager to retrieve secrets from the key vault."
  default     = null
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "Boolean flag to specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions"
  default     = null
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Allow purge_protection be enabled for this Key Vault"
  default     = true
}


variable "soft_delete_retention_days" {
  type        = number
  description = "he number of days that items should be retained for once soft-deleted"
  default     = 90
}

variable "iothub_hostname" {
  type        = string
  description = "The endpoint of the iothub"
}

variable "DBHOST" {
  type        = string
  description = "Mysql servername"
}

variable "admin_username" {
  type        = string
  description = "Mysql admin username"
}

variable "AD-CLIENT-ID" {
  type        = string
  description = "Mysql admin password"
}

variable "ams-account-name" {
  type        = string
  description = "Mediaservice name"
}

variable "ams-client-id" {
  type = string
  description = "Mediaservice id"
}

variable "azure-container" {
  type        = string
  description = "Azure Container"
}

variable "azure-acc-name" {
  type = string
  description = "Storage account name"
}