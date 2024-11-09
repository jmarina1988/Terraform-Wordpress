################################################################################
# Variables par solicitar
################################################################################
################################################################################
# Tags
################################################################################
variable "tags" {
  description = "Tags para aplicar al laboratorio"
  type        = map(string)
  default = {
    Owner = "Javier Manuel"
    Environment = "Test"
    Project = "Lab5"
  
   }
}
################################################################################
# Route53
################################################################################
#variable "domain" {
#  default = "lab5plus.com"
#  description = "dominio"
#  type        = string
#}

#variable "subdomain" {
#  default = "www"
#  description = "Subdominio"
#  type        = string
#}