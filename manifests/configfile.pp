#
# = Define: libvirt::configfile
#
# The define manages libvirt configfile
#
#
# == Parameters
#
# [*ensure*]
#   String. Default: present
#   Manages configfile presence. Possible values:
#   * 'present' - Install package, ensure files are present.
#   * 'absent' - Stop service and remove package and managed files
#
# [*template*]
#   String. Default: Provided by the module.
#   Sets the path of a custom template to use as content of configfile
#   If defined, configfile file has: content => content("$template")
#   Example: template => 'site/configfile.conf.erb',
#
# [*options*]
#   Hash. Default ''. Needs: 'template'.
#   An hash of custom options to be used in templates to manage any key pairs of
#   arbitrary settings.
#
# [*path*]
#   String. Default: ''.
#   If defined the file is saved in the $path.
#   If not defined the path is $config_dir/$title
#
define libvirt::configfile (
  $template ,
  $ensure   = present,
  $options  = '' ,
  $path     = '' ,
  $ensure   = present ) {

  include libvirt

  $file_path = $path ? {
    ''      => "${libvirt::config_dir}/${name}",
    default => $path,
  }

  file { "libvirt_configfile_${name}":
    ensure  => $ensure,
    path    => $file_path,
    mode    => $libvirt::config_file_mode,
    owner   => $libvirt::config_file_owner,
    group   => $libvirt::config_file_group,
    require => Package[$libvirt::package],
    notify  => $libvirt::manage_registry_service_autorestart,
    content => template($template),
    replace => $libvirt::manage_file_replace,
    audit   => $libvirt::manage_audit,
  }

}
