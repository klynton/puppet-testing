# == Class: testing
#
# Just a quick Puppet module to do some testing things.
#
# === Parameters
#
# Document parameters here.
#
# [*docroot*]
#   The directory that the webserver should use as the directory containing files to serve..
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
# Copyright 2014 Your name here, unless otherwise noted.
#
class testing {


}
