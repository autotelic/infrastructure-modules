resource "github_organization_webhook" "organization_webhook" {

  name = "web"

  configuration {
    url          = "${var.url}"
    content_type = "${var.content_type}"
    insecure_ssl = "${var.insecure_ssl}"
  }

  active = "${var.active}"

  events = "${var.events}"
}