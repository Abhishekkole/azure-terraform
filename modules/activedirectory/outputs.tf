output "user_name" {
    description="Name of the user who was added"
    value=azuread_user.example.display_name
}