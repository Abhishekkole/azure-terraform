# Retrieve domain information
data "azuread_domains" "activedge_domain" {
  only_initial = true
}

# Create an application
resource "azuread_application" "activedge_app" {
  display_name = "activedge_app"
}

# Create a service principal

# Create a user
resource "azuread_user" "ad_user" {
  user_principal_name = "${var.user_name}@${data.azuread_domains.activedge_domain.domains.0.domain_name}"
  display_name        = var.user_name
  password            = var.password
}
