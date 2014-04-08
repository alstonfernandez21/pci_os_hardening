class set_daemon_umask ($umask = '027',
		){

 case $operatingsystem {
  RedHat,CentOS: {
    file {"/etc/sysconfig/init":
        owner   => "root",
        group   => "root",
        mode    => 0644,
        content => template("cis/init.erb"),
     }
	package {"dhcp":
		ensure => "absent"
	}

  }

  Ubuntu : {
	package {"dhcp3-server":
		ensure => "absent"
	}
  } 
 }
}
