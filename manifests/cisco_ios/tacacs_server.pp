# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include network_example::cisco_ios::tacacs_server
class network_example::cisco_ios::tacacs_server (
  Boolean $noop = false,
  Boolean $purge = false,
  Hash $servers = {},
) {

  $servers.each |$server, $parameters| {
    tacacs_server { $server:
      ensure            => $parameters[ensure],
      hostname          => $parameters[hostname],
      single_connection => $parameters[single_connection],
      vrf               => $parameters[vrf],
      port              => $parameters[port],
      key               => $parameters[key],
      key_format        => $parameters[key_format],
      timeout           => $parameters[timeout],
      group             => $parameters[group],
      noop              => $noop,
    }
  }

  # Purge unmanaged instances if enabled
  if $purge {
    resources { 'tacacs_server':
      purge => true,
      noop  => $noop,
    }
  }

}