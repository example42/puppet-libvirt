# Puppet module: libvirt

## DEPRECATION NOTICE
This module is no more actively maintained and will hardly be updated.

Please find an alternative module from other authors or consider [Tiny Puppet](https://github.com/example42/puppet-tp) as replacement.

If you want to maintain this module, contact [Alessandro Franceschi](https://github.com/alvagante)


This is a Puppet module for libvirt based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Alessandro Franceschi / Lab42

Official site: http://www.example42.com

Official git repository: http://github.com/example42/puppet-libvirt

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.

## USAGE - Basic management

* Install libvirt with default settings

        class { 'libvirt': }

* Install a specific version of libvirt package

        class { 'libvirt':
          version => '1.0.1',
        }

* Disable libvirt service.

        class { 'libvirt':
          disable => true
        }

* Remove libvirt package

        class { 'libvirt':
          absent => true
        }

* Enable auditing without without making changes on existing libvirt configuration files

        class { 'libvirt':
          audit_only => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'libvirt':
          source => [ "puppet:///modules/lab42/libvirt/libvirt.conf-${hostname}" , "puppet:///modules/lab42/libvirt/libvirt.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'libvirt':
          source_dir       => 'puppet:///modules/lab42/libvirt/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'libvirt':
          template => 'example42/libvirt/libvirt.conf.erb',
        }

* Automatically include a custom subclass

        class { 'libvirt':
          my_class => 'libvirt::example42',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'libvirt':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'libvirt':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'libvirt':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'libvirt':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


[![Build Status](https://travis-ci.org/example42/puppet-libvirt.png?branch=master)](https://travis-ci.org/example42/puppet-libvirt)
