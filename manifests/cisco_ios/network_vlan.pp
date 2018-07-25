# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include network_example::cisco_ios::network_vlan
class network_example::cisco_ios::network_vlan (
  Boolean $purge = false,
  Hash $vlans = {},
) {

  $vlans.each |$vlan, $parameters| {
    network_vlan { $vlan:
      ensure    => $parameters[ensure],
      shutdown  => $parameters[shutdown],
      vlan_name => $parameters[vlan_name],
    }
  }

  # Purge unmanaged instances if enabled
  if $purge {
    resources { 'network_vlan': purge => true }
  }

}
