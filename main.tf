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