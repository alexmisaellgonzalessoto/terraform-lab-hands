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

  upload {
    content = file("${path.module}/frontend/index.html")
    file    = "/usr/share/nginx/html/index.html"
  }
}

resource "docker_image" "node" {
  name = "node:24-alpine"
}

resource "docker_container" "api_dev" {
  name  = "api-dev"
  image = docker_image.node.image_id

  ports {
    internal = 3000
    external = 4002
  }

  networks_advanced {
    name = docker_network.dev.name
  }

  upload {
    content = file("${path.module}/backend/index.js")
    file    = "/app/index.js"
  }

  working_dir = "/app"

  command = ["node", "index.js"]
}