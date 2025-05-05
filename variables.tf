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

variable "name" {
  type        = string
  description = "The name of the certificate issuer"
}

variable "key_vault_id" {
  type        = string
  description = "Id of the key vault to which certificates need to be added."
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

variable "password" {
  type        = string
  description = "The password of the certificate issuer account"
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
