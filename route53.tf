
# Zona privada
################################################################################
data  "aws_route53_zone" "hosted_zone" {
name = var.domain
}

resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone_id
  name    = var.subdomain
  type    = "A"
  alias {
    name                   = aws_lb.alb-internal.dns_name
    zone_id                = aws_lb.alb-internal.zone_id
    evaluate_target_health = true
}
}
################################################################################
# DNS - BD
############################################
resource "aws_route53_record" "db" {
  zone_id = "db.lab5.internal"
  type = "CNAME"
  ttl = "300"
  records = [aws_db_instances.rds.adrees]
}