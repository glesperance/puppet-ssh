# Class: ssh
#
# This module manages ssh
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class ssh {
	require ssh::params
	
	include ssh::install, ssh::config, ssh::service
}
