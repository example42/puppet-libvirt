# Class: libvirt::params
#
# This class defines default parameters used by the main module class libvirt
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to libvirt class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class libvirt::params {

  ### Application related parameters

  $package = $::osfamily ? {
    'debian' => 'libvirt-bin',
    'redhat' => 'libvirt',
    default  => 'libvirt',
  }

  $service = $::osmfaily ? {
    'debian' => 'libvirt-bin',
    'redhat' => 'libvirtd',
    default  => 'libvirtd',
  }

  $service_guests = $::osfamily ? {
    default => 'libvirt-guests',
  }

  $service_status = $::osfamily ? {
    default => true,
  }

  $process = $::osfamily ? {
    default => 'libvirtd',
  }

  $process_args = $::osfamily ? {
    default => '',
  }

  $process_user = $::osfamily ? {
    default => 'root',
  }

  $config_dir = $::osfamily ? {
    default => '/etc/libvirt',
  }

  $config_file = $::osfamily ? {
    default => '/etc/libvirt/libvirtd.conf',
  }

  $config_file_mode = $::osfamily ? {
    default => '0644',
  }

  $config_file_owner = $::osfamily ? {
    default => 'root',
  }

  $config_file_group = $::osfamily ? {
    default => 'root',
  }

  $config_file_init = $::osfamily ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/libvirt',
    default                   => '/etc/sysconfig/libvirt',
  }

  $pid_file = $::osfamily ? {
    default => '/var/run/libvirt/network/default.pid',
  }

  $data_dir = $::osfamily ? {
    default => '/var/lib/libvirt',
  }

  $log_dir = $::osfamily ? {
    default => '/var/log/libvirt',
  }

  $log_file = $::osfamily ? {
    default => '/var/log/libvirt/libvirtd.log',
  }

  $has_guests_service = $::osfamily ? {
    'debian' => $::lsbdistcodename ? {
      'wheezy' => true,
      default  => false,
    },
    'redhat' => true,
    default  => true,
  }

  $port = ''
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = false
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = 'localhost'
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
