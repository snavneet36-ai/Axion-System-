data "azurerm_subnet" "subnets" {
    for_each = var.virtual_machines

    name = each.value.subnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name

}
data "azurerm_public_ip" "pips" {
  for_each = var.virtual_machines
  name = each.value.pip_name
  resource_group_name = each.value.resource_group_name

}
data "azurerm_network_security_group" "nsg"{
  for_each = var.virtual_machines
   name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_interface" "nics" {
    for_each = var.virtual_machines
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pips[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg_association" {
  for_each = var.virtual_machines

  network_interface_id      = azurerm_network_interface.nics[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}


resource "azurerm_linux_virtual_machine" "vms" {
     for_each = var.virtual_machines
  name                = each.value.vm_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.vm_size
  
  

  admin_username = each.value.admin_username

  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id
  ]

  disable_password_authentication = false

  admin_password = each.value.admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}