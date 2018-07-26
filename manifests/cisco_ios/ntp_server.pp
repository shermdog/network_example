# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include network_example::cisco_ios::ntp_server
class network_example::cisco_ios::ntp_server (
  Boolean $noop = false,
  Boolean $purge = false,
  Hash $servers = {},
) {

  $servers.each |$server, $parameters| {
    ntp_server { $server:
      ensure           => $parameters[ensure],
      key              => $parameters[key],
      minpoll          => $parameters[minpoll],
      maxpoll          => $parameters[maxpoll],
      prefer           => $parameters[prefer],
      source_interface => $parameters[source_interface],
      vrf              => $parameters[vrf],
      noop             => $noop,
    }
  }

  # Purge unmanaged instances if enabled
  if $purge {
    resources { 'ntp_server':
      purge => true,
      noop  => $noop,
    }
  }

}
