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

resource "azurerm_key_vault_certificate_issuer" "issuer" {
  name          = var.name
  key_vault_id  = var.key_vault_id
  provider_name = var.provider_name
  org_id        = var.org_id
  account_id    = var.account_id
  password      = var.password

  dynamic "admin" {
    for_each = var.admins
    content {
      email_address = admin.value.email_address
      first_name    = admin.value.first_name
      last_name     = admin.value.last_name
      phone         = admin.value.phone
    }
  }
}
