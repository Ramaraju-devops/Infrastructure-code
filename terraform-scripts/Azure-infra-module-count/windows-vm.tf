resource "azurerm_virtual_network" "demovnet01" {
  name                = "${var.vnetname01}"
  address_space       = ["10.0.0.0/24"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rgdeploy1.name}"
}

resource "azurerm_subnet" "demsubnet01" {
  name                 = "${var.snetname01}"
  resource_group_name  = "${azurerm_resource_group.rgdeploy1.name}"
  virtual_network_name = "${azurerm_virtual_network.demovnet01.name}"
  address_prefixes     = ["10.0.0.0/28"]
}

resource "azurerm_network_interface" "demonic01" {
  name                = "${var.nicname01}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rgdeploy1.name}"

  ip_configuration {
    name                          = "demoipconfig"
    subnet_id                     = "${azurerm_subnet.demsubnet01.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "demwinvm01" {
  name                = "${var.winvmname01}"
  resource_group_name = "${azurerm_resource_group.rgdeploy1.name}"
  location            = "${var.location}"
  size                = "Standard_B4ms"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.demonic01.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}