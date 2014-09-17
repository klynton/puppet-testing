# == Class: testing
#
# Just a quick Puppet module to do some testing things.
#
# === Parameters
#
# Document parameters here.
#
# [*vhost_name*]
#   The name of the nginx virtual host to create.
#
# [*docroot*]
#   The directory that the webserver should use as the directory containing files to serve.
#
# [*port_number*]
#   The port number you want the virtual host to listen on.
#
# [*repo_url*]
#   The Git repo URL that you want to be served from the docroot.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*docroot*]
#   The directory that the webserver should use as the directory containing files to serve.
#
# === Examples
#
#  class { 'testing': 
#    vhost_name  => 'my-vhost',
#    docroot     => '/var/www/html',
#    port_number => '80',
#    repo_url    => 'git://github.com/klynton/puppet-testing.git',
#  }
#
# === Authors
#
# Klynton Jessup <klynton@objectsyndicate.com>
#
# === Copyright
#
# Copyright 2014 Klynton Jessup
#
class testing (
  $vhost_name        = 'klynton-jessup',
  $docroot           = '/srv/klynton-jessup',
  $port_number       = '8000',
  $repo_url          = 'git://github.com/puppetlabs/exercise-webpage.git',
){
  validate_string($repo_url)
  validate_string($port_number)
  validate_absolute_path($docroot)
  include git
  include nginx
  git::repo { $repo_url:
    path    => $docroot,
    source  => $repo_url,
    require => Nginx::Resource::Vhost[$vhost_name],
  }
  nginx::resource::vhost { $vhost_name:
    ensure      => 'present',
    www_root    => $docroot,
    listen_port => $port_number,
    notify      => Class['nginx::service'],
  }
}
