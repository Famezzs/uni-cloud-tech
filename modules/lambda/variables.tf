variable "context" {
  type = object({
    enabled             = bool
    namespace           = string
    environment         = string
    stage               = string
    name                = string
    delimiter           = string
    attributes          = list(string)
    tags                = map(string)
    additional_tag_map  = map(string)
    regex_replace_chars = string
    label_order         = list(string)
    id_length_limit     = number
    label_key_case      = string
    label_value_case    = string
  })
  default = {
    enabled             = true
    namespace           = null
    environment         = null
    stage               = null
    name                = null
    delimiter           = null
    attributes          = []
    tags                = {}
    additional_tag_map  = {}
    regex_replace_chars = null
    label_order         = []
    id_length_limit     = null
    label_key_case      = null
    label_value_case    = null
  }
}

variable "name" {
  description = "Name"
  type        = string
}

variable "code_path" {
  description = "Path to Code to Use for the Lambda"
  type        = string
}

variable "output_path" {
  description = "Zip Output Path"
  type        = string
}

variable "role_arn" {
  description = "Role ARN"
  type        = string
}

variable "handler" {
  description = "Handler Path"
  type        = string
}

variable "runtime" {
  description = "Runtime"
  type        = string
}