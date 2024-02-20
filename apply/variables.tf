

variable "hcloud_token" {
  sensitive = true
  default   = ""
}

variable "network_region" {
  type    = string
  default = "eu-central"
}

variable "cluster_name" {
  description = "The name of the k3s cluster"
  type        = string
  default     = "perceptdata-k3s-test"
}

variable "control_plane_name" {
  type    = string
  default = "control-plane-nbg1-test"
}

variable "control_plane_server_type" {
  type    = string
  default = "cx11"
}

variable "control_plane_location" {
  type    = string
  default = "nbg1"
}

variable "control_plane_count" {
  type    = number
  default = 1
}

variable "agent_node_name" {
  type    = string
  default = "worker-node-test"
}

variable "agent_node_server_type" {
  type    = string
  default = "cx41"
}

variable "agent_node_location" {
  type    = string
  default = "nbg1"
}

variable "agent_node_count" {
  type    = number
  default = 0
}


variable "base_domain" {
  type    = string
  default = "perception-it.int"
}
