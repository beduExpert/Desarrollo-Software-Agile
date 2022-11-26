resource "docker_image" "sonarqube" {
  name = "sonarqube"
}

resource "docker_container" "sonarqube" {
  name = "sonarqube"
  image = "${docker_image.sonarqube.latest}"
  ports {
    internal = 9000
    external = 9000
  }
  ports {
    internal = 9092
    external = 9092
  }
  depends_on = [
    docker_image.sonarqube
  ]
}

