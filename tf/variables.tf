#Variable
variable "project_id" {
  type        = string
  description = "Project ID"
  default = "arched-catwalk-392902"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Zone name"
  default     = "us-central1-a"
}

variable "machineType" {
  type        = string
  description = "Machine type"
  default     = "n1-standard-1"
}

variable "creds" {
  type        = string
  description = "Map your credential.json file"
  default     = "/Users/mayankkoli/.config/gcloud/application_default_credentials.json"
}
