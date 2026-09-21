rgs = {
  rg1 = {
    rg_name     = "rg-axion-sandbox-ci-01"
    rg_location = "Central India"
  }
}

vnets = {
  vnet1 = {
    vnet_name           = "vnet-axion-sandbox-c01"
    resource_group_name = "rg-axion-sandbox-ci-01"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    subnet_name          = "frontend-subnet-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-c01"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet3 = {
    subnet_name          = "backend-subnet-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-c01"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet2 = {
    subnet_name          = "database-subnet-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-c01"
    address_prefixes     = ["10.0.3.0/24"]
  }

}

publicIPs = {
  pips1 = {
    name                = "pip-frontend-vm-axion-sandbox-ci-01"
    resource_group_name = "rg-axion-sandbox-ci-01"
    location            = "Central India"
    allocation_method   = "Static"
  }
  pips2 = {
    name                = "pip-backend-vm-axion-sandbox-ci-01"
    resource_group_name = "rg-axion-sandbox-ci-01"
    location            = "Central India"
    allocation_method   = "Static"
  }
  pips3 = {
    name                = "pip-database-vm-axion-sandbox-ci-01"
    resource_group_name = "rg-axion-sandbox-ci-01"
    location            = "Central India"
    allocation_method   = "Static"
  }
}

virtual_machines = {
  # vm1 = {
  #   vm_name              = "frontend-vm-axion-sandbox-ci-01"
  #   resource_group_name  = "rg-axion-sandbox-ci-01"
  #   location             = "Central India"
  #   vm_size              = "Standard_B1ls"
  #   admin_username       = "adminuser1234"
  #   admin_password       = "Password12345!"
  #   subnet_name          = "frontend-subnet-axion-sandbox-ci-01"
  #   virtual_network_name = "vnet-axion-sandbox-c01"
  #   nic_name             = "nic-frontend-vm-axion-sandbox-ci-01"
  #   pip_name             = "pip-frontend-vm-axion-sandbox-ci-01"
  #   nsg_name             = "frontend-nsg-axion-sandbox-ci-01"
  # }

  # vm2 = {
  #   vm_name              = "backend-vm-axion-sandbox-ci-01"
  #   resource_group_name  = "rg-axion-sandbox-ci-01"
  #   location             = "Central India"
  #   vm_size              = "Standard_B1ls"
  #   admin_username       = "adminuser1234"
  #   admin_password       = "Password12345!"
  #   subnet_name          = "backend-subnet-axion-sandbox-ci-01"
  #   virtual_network_name = "vnet-axion-sandbox-c01"
  #   nic_name             = "nic-backend-vm-axion-sandbox-ci-01"
  #   pip_name             = "pip-backend-vm-axion-sandbox-ci-01"
  #   nsg_name             = "backend-nsg-axion-sandbox-ci-01"

  # }

  vm3 = {
    vm_name              = "database-vm-axion-sandbox-ci-01"
    resource_group_name  = "rg-axion-sandbox-ci-01"
    location             = "Central India"
    vm_size              = "Standard_B2s"
    admin_username       = "adminuser1234"
    admin_password       = "Password12345!"
    subnet_name          = "database-subnet-axion-sandbox-ci-01"
    virtual_network_name = "vnet-axion-sandbox-c01"
    nic_name             = "nic-database-vm-axion-sandbox-ci-01"
    pip_name             = "pip-database-vm-axion-sandbox-ci-01"
    nsg_name             = "database-nsg-axion-sandbox-ci-01"
  }

}
nsg = {
  # nsg1 = {
  #   name                = "frontend-nsg-axion-sandbox-ci-01"
  #   location            = "Central India"
  #   resource_group_name = "rg-axion-sandbox-ci-01"
  # }

  # nsg2 = {
  #   name                = "backend-nsg-axion-sandbox-ci-01"
  #   location            = "Central India"
  #   resource_group_name = "rg-axion-sandbox-ci-01"
  # }

  nsg3 = {
    name                = "database-nsg-axion-sandbox-ci-01"
    location            = "Central India"
    resource_group_name = "rg-axion-sandbox-ci-01"
  }
}

