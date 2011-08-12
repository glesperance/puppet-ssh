# Class: ssh::params
#
#
class ssh::params {
	# The openssh client package name
	$client_pkg_name = $operatingsystem ? {
		/(?i)(Debian|Ubuntu)/ => 'openssh-client',
		/(?i)(Redhat|CentOS)/ => 'openssh'
	}
	
	$service_name = $operatingsystem ? {
		/(?i)(Debian|Ubuntu)/ => 'ssh',
		/(?i)(Redhat|CentOS)/ => 'sshd'
	}
	
	$permit_root_login = $ssh_permit_root_login ? {
		'yes'   => 'yes',
		'no'    => 'no',
		default => 'no'
	}
	
	$listen_on_private = $ssh_listen_on_private ? {
		'true'  => true,
		'false' => false,
		default => false
	}
	
	$password_authentication = $ssh_secure ? {
		'true'  => 'no',
		'false' => 'yes',
		default => 'yes'
	}
	
	$use_pam = $ssh_secure ? {
		'true'  => 'no',
		'false' => 'yes',
		default => 'yes'
	}
	
	$syslog_facility = $operatingsystem ? {
		/(?i)(Debian|Ubuntu)/ => 'AUTH',
		/(?i)(Redhat|CentOS)/ => 'AUTHPRIV'
	}
	
	$authorized_keys_file = $operatingsystem ? {
		/(?i)(Debian|Ubuntu)/ => '%h/.ssh/authorized_keys',
		/(?i)(Redhat|CentOS)/ => '.ssh/authorized_keys'
	}
	
	$subsystem_sftp = $operatingsystem ? {
		/(?i)(Debian|Ubuntu)/ => '/usr/lib/openssh/sftp-server',
		/(?i)(Redhat|CentOS)/ => '/usr/libexec/openssh/sftp-servers'
	}
}
