class remove_xwindows (
			$remove_packages = 'true',
			$remove_redpackages = ["xorg-x11-xauth",],	
			$remove_ubuntupackages = ["xserver-xorg",],		      
				) {
 case $operatingsystem {
  RedHat,CentOS: {
    file {"/etc/sysconfig/init":
        owner   => "root",
        group   => "root",
        mode    => 0644,
        content => template("cis/init.erb"),
     }
    if $remove_packages == 'true' {
      package {$remove_redpackages:
	ensure => "absent"
      } 
    }
  }

   Ubuntu: {
   if $remove_packages == 'true' {
      package {$remove_ubuntupackages:
        ensure => "absent"
      }
   }  
  } 
 }
}
