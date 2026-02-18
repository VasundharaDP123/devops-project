terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "app_image" {
  name = "vasundhara13/devops-app:latest"
}

resource "docker_container" "app_container" {
  name  = "devops-app-container"
  image = docker_image.app_image.image_id

  ports {
    internal = 5000
    external = 5000
  }
}