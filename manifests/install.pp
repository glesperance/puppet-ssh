# Class: ssh::install
#
#
class ssh::install {
	package { 'openssh-client':
		name   => $ssh::params::client_pkg_name,
		ensure => latest
	}
	
	package { 'openssh-server':
		ensure => latest
	}
	
	if $operatingsystem =~ /(?i)(Debian|Ubuntu)/ {
		package { [ 'openssh-blacklist', 'openssh-blacklist-extra' ]:
			ensure => latest
		}
	}
}
