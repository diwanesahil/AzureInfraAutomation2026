output "vm_id" {
  value       = azurerm_windows_virtual_machine.vm.id
  description = "The ID of the Windows VM"
}

output "vm_name" {
  value       = azurerm_windows_virtual_machine.vm.name
  description = "The name of the Windows VM"
}

output "private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "Private IP address of the VM"
}

output "network_interface_id" {
  value       = azurerm_network_interface.nic.id
  description = "The ID of the network interface"
}
