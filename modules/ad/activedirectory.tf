data "azuread_client_config" "current" {}

data "azuread_domains" "example" {
  only_initial = true
}


resource "azuread_user" "example" {
  display_name        = "Ak"
  password            = "notSecure123"
  user_principal_name = "AK@${data.azuread_domains.example.domains.0.domain_name}"
}

resource "azuread_user" "example1" {
  display_name        = "ARG"
  password            = "notSecure123"
  user_principal_name = "DK@${data.azuread_domains.example.domains.0.domain_name}"
}





resource "azuread_group" "example" {
  display_name     = "MyGroup"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true

  members = [
    azuread_user.example.object_id,azuread_user.example1.object_id
    /* more users */
  ]
}
