# Proxmox-TF  <img src=https://static-00.iconduck.com/assets.00/terraform-icon-1803x2048-hodrzd3t.png width="90"> <img src=https://camo.githubusercontent.com/cb6c50486cf76c4a9a9a4c7811f8bf97f59f7512d11119a386021086997cae0e/68747470733a2f2f7777772e70726f786d6f782e636f6d2f696d616765732f70726f786d6f782f50726f786d6f785f73796d626f6c5f7374616e646172645f6865782e706e67 width="110"> #
Deploy Containers to Proxmox using Terraform.

## Description ##
This is Terraform code for creating new LXC's in Proxmox and pushing secrets to Infisical (https://infisical.com/)

## Getting Started ##
### Dependencies ###
1. Proxmox configured as you hypervisor.
2. Terraform installed on local machine.
3. Infisical server, either self-hosted or Saas (Optional). You can remove the Infisical code from ``providers.tf`` ``lxc.tf`` ``variables.tf`` ``infisical.tf`` and ``output.tf`` if you choose not to use it.

### Installing ###
4. Clone the repo. ``` git clone https://github.com/bbonser/proxmox-tf.git ```
5. Modify any variables to your existing configuration in Proxmox.

### Executing ###
``` Terraform init ```

``` Terraform plan ```

``` Terraform apply```
