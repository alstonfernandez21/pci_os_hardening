class cron_cis ($cron_allowed = ["user1", "user2", "user3",],
		$at_allowed = ["user4",],

		 ) {
  $files = ["/etc/cron.d", "/etc/crontab", "/etc/cron.daily", "/etc/cron.hourly", "/etc/cron.monthly", "/etc/cron.weekly", ]
  case $operatingsystem {
	"Redhat","CentOS": { 
		service {"crond":
			enable => true,
		}
	}
	"Ubuntu": {
		service {"cron":
			enable => true,
		}
		service {"anacron":
			enable => true,	
		}
		service {"atd":
			enable => false,
		}
		file {"/etc/cron.deny":
			ensure => removed,
		}
		file {"/etc/at.deny":
			ensure => removed,
		}
  		
   	}

  }


  file {"/etc/cron.allow":
	owner => "root",
	group => "root",
	mode  => "0640",
	content => template("cis/cron.allow.erb"),  
  }

  file {"/etc/at.allow":
	owner => "root",
	group => "root",
	mode => "0640",
	content => template("cis/at.allow.erb")
  }	

  file {$files:
	owner => "root",
	group => "root",	
	mode  => "0700",
  }

} 
