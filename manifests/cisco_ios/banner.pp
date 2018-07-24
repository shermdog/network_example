# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include network_example::cisco_ios::banner
class network_example::cisco_ios::banner (
  String $motd,
) {

  banner { 'default':
    motd => $motd,
  }

}
