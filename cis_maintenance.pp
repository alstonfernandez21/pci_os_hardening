class cis_maintenance {
	case $operatingsystem {
		"Redhat","CentOS": {
			$files_1 = ["/etc/passwd", "/etc/group", ]
			$files_2 = ["/etc/shadow", "/etc/gshadow", ]

			file {$files_1:
				owner => "root",
				group => "root",
				mode => 644,
			}
			
			file {$files_2:
				owner => "root",
				group => "root",
				mode => 400,
			} 	
		
		}
	
		"Ubuntu": {
			
			$files_1 = ["/etc/passwd", "/etc/group", ]
			$files_2 = ["/etc/shadow", "/etc/gshadow", ]
			
			 file {$files_1:
                                owner => "root",
                                group => "root",
                                mode => 644,
                        }
			file {$files_2:
                                owner => "root",
                                group => "shadow",
                                mode => 400,
                        }


		}



	}
	exec { "find unowned files and directories":
		command  => "find / -xdev \( -nouser -o -nogroup \) -print > /var/log/unowned_files_folders.log",
    		timeout  => 100000,
    		path     => "/bin/:/usr/bin/",
   	}

	file {"/root/cis_maintenance.sh":
		owner => "root",
		group => "root",
		mode  => "755",
		content => template("cis/cis_maintenance.sh"),
		before => Exec["Ensure_No_Legacy"],
	}
			
	
	exec {"Ensure_No_Legacy":
		command => "sh /root/cis_maintenance.sh",
		timeout => 100000,
		path	=> "/bin/:/usr/bin/",
	}


	
}
