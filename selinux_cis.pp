class selinux_cis {

case $operatingsystem {
  "CentOS","RedHat": { $remove_packages = [ "setroubleshoot", "mcstrans", ] }
  "Ubuntu": { $remove_packages = [ "" ] }
}

package { $remove_packages:
  ensure => "absent"
}




}
