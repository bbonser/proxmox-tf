# Proxmox-TF  <img src=https://static-00.iconduck.com/assets.00/terraform-icon-1803x2048-hodrzd3t.png width="100"> #
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
