output "github_repositories" {
    value = [
        "${github_repository.terraform.ssh_clone_url}",
    ]
}

output "github_teams" {
    value = [
        "${github_team.owners.name}",
    ]
}