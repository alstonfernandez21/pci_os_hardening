class pam_cis {

case $operatingsystem {
	"Redhat","CentOS": {
		if $operatingsystemrelease =~ /^6/ {
				file {"/etc/pam.d/system-auth":
					owner => "root",
					group => "root",
					mode  => 0600,
					content => template("cis/system-auth_c6.erb"),
				}
				file {"/etc/login.defs":
                                        owner => "root",
                                        group => "root",
                                        mode => 0640,
                                        content => template("cis/login.defs_r6"),
                                }
				file {"/etc/default/useradd":
                                        owner => "root",
                                        group => "root",
                                        mode  => "0640",
                                        content => template("cis/useradd_rh6"),
                                }
				file {"/etc/pam.d/su":
					owner => "root",
					group => "root",
					mode  => "0640",
					content => template("cis/su_r6"),
				}
				file {"/etc/profile":
                                        owner => "root",
                                        group => "root",
                                        mode => "0644",
                                        content => template("cis/etc_profile_r6"),
                                }

	
		}
		if $operatingsystemrelease =~ /^5/ {
				file {"/etc/pam.d/system-auth":
					owner => "root",	
					group => "root", 
					mode => 0600,
					content => template("cis/system-auth_c5.erb"),
				}
				file {"/etc/login.defs":
					owner => "root",
					group => "root",
					mode => 0640,
					content => template("cis/login.defs_r5.erb"),
				}
				file {"/etc/libuser.conf":
					owner => "root",
					group => "root",
					mode => "0640",
					content => template("cis/libuser.conf_r5.erb"),
				}
				file {"/etc/pam.d/su":
					owner => "root",
					group => "root",
					mode => "0640",
					content => template("cis/su_r5"),
				}
				file {"/etc/profile":
                                        owner => "root",
                                        group => "root",
                                        mode => "0644",
                                        content => template("cis/etc_profile_r5"),
                                }

					
			
			
		}		
				
		
	}
	
	"Ubuntu": {
				file {"/etc/pam.d/common-password":
					owner => "root",
					group => "root",
					mode  => "0640",
					content => template("cis/common-password_ubuntu"),
				}
				file {"/etc/login.defs":	
					owner => "root",
					group => "root",
					mode => "0640",
					content => template("cis/login.defs_ubuntu"),
				}
				file {"/etc/default/useradd":
					owner => "root",
					group => "root",
					mode  => "0640",
					content => template("cis/useradd_ubuntu"),
				}
				file {"/etc/pam.d/su":
                                        owner => "root",
                                        group => "root",
                                        mode => "0640",
                                        content => template("cis/su_ubuntu"),
                                }
				file {"/etc/profile":
					owner => "root",
					group => "root",
					mode => "0644",
					content => template("cis/etc_profile_ubuntu"),
				}
					

	}


}
}
