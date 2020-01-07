terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "stackenschneider"

    workspaces {
      name = "terraform"
    }
  }
}

provider "github" {
  token        = var.github_token
  organization = "stackenschneider"
  version      = "2.2.1"
}

resource "github_repository" "terraform" {
  name         = "terraform"
  description  = "Configure https://github.com/stackenschneider with Terraform"
  auto_init    = true
  has_projects = true
}

resource "github_repository_project" "project" {
  name       = "A Repository Project"
  repository = github_repository.terraform.name
  body       = "This is a repository project."
}

resource "github_team" "owners" {
  name        = "owners"
  description = "Root level access to all repositories"
  privacy     = "closed"
}

resource "github_team_membership" "owners_alexanderilyin" {
  team_id  = github_team.owners.id
  username = "alexanderilyin"
  role     = "maintainer"
}

resource "github_team_repository" "terraform_owners" {
  team_id    = github_team.owners.id
  repository = github_repository.terraform.name
  permission = "admin"
}
