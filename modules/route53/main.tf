data "aws_route53_zone" "public-zone" {
  name         = var.HOSTED_ZONE_NAME
  private_zone = false
}
resource "aws_route53_record" "cloudfront_record" {
  zone_id = data.aws_route53_zone.public-zone.zone_id
  name    = "${var.ADDITIONAL_DOMAIN_NAME}"
  type    = "A"

  alias {
    name                   = var.CLOUDFRONT_DOMAIN_NAME
    zone_id                = var.CLOUDFRONT_HOSTED_ZONE_ID
    evaluate_target_health = false
  }
}