// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

variable "product_family" {
  description = <<EOF
    (Required) Name of the product family for which the resource is created.
    Example: org_name, department_name.
  EOF
  type        = string
  default     = "dso"
}

variable "product_service" {
  description = <<EOF
    (Required) Name of the product service for which the resource is created.
    For example, backend, frontend, middleware etc.
  EOF
  type        = string
  default     = "kube"
}

variable "environment" {
  description = "Environment in which the resource should be provisioned like dev, qa, prod etc."
  type        = string
  default     = "dev"
}

variable "environment_number" {
  description = "The environment count for the respective environment. Defaults to 000. Increments in value of 1"
  type        = string
  default     = "000"
}

variable "region" {
  description = "AWS Region in which the infra needs to be provisioned"
  type        = string
  default     = "eastus"
}

variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-launch-module_library-resource_name to generate resource names"
  type = map(object(
    {
      name       = string
      max_length = optional(number, 60)
    }
  ))
  default = {
    rg = {
      name       = "rg"
      max_length = 60
    }
    kv = {
      name       = "kv"
      max_length = 24
    }
  }
}

variable "role_assignment_type" {
  description = "The type of role assignment to be created"
  type        = string
  default     = "ServicePrincipal"
}

variable "name" {
  type        = string
  description = "The name of the certificate issuer"
}

variable "provider_name" {
  type        = string
  description = <<-EOF
    The name of the certificate issuer provider.
    Possible values are: DigiCert, GlobalSign, OneCertV2-PrivateCA, OneCertV2-PublicCA and SslAdminV2
  EOF
}

variable "org_id" {
  type        = string
  description = "The organization id of the certificate issuer"
}

variable "account_id" {
  type        = string
  description = "The account id of the certificate issuer"
}

variable "admins" {
  type = list(object({
    email_address = string
    first_name    = optional(string)
    last_name     = optional(string)
    phone         = optional(string)
  }))
  description = "Admin contact information for the certificate issuer"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "The tags for the resources"
  default     = {}
}
