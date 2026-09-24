terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {
  context = "desktop-linux"
}
resource "docker_image" "nginx" {
  name = "nginx:1.31.6"
}
resource "docker_network" "dev" {
  name   = "lab-dev"
  driver = "bridge"
}
resource "docker_container" "web_dev" {
  name  = "web-dev"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 4001
  }

  networks_advanced {
    name = docker_network.dev.name
  }
}