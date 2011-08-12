# Class: ssh::service
#
#
class ssh::service {
	service { 'ssh':
		name   => $ssh::params::service_name,
		ensure     => running,
		enable     => true,
		hasrestart => true,
		hasstatus  => true,
		require    => Class['ssh::config']
	}	
}
