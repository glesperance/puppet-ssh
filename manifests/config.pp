# Class: ssh::config
#
#
class ssh::config {
	file { '/etc/ssh/sshd_config':
		ensure  => present,
		content => template('ssh/sshd_config.erb'),
		owner   => root,
		group   => root,
		mode    => 644,
		notify  => Class['ssh::service'],
		require => Class['ssh::install']		
	}
}
