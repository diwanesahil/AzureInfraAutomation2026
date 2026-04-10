variable "resource_group_Name" {
  type = string

}
variable "location" {
  type = string
}
variable "Virtual-network-name" {
  type = string
}
variable "address_space" {
  type = list(string)
}
variable "subscription_id" {
  type = string
}
variable "address_prefixes" {
  type = list(string)
}