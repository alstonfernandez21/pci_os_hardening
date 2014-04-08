class remove_legacy_services {

# Remove following packages for CentOS
case $operatingsystem {
  centos: { $remove_packages = [ "telnet-server", "rsh-server", "rsh", "ypbind", "ypserv", "tftp-server", "tftp", "talk", "talk-server",  ] }
  ubuntu: { $remove_packages = [ "telned", "rsh-server", "rsh-client", "nis", "tftpd", "tftp", "talkd", "talk", ] }

}

package { $remove_packages:
    ensure => "absent"
}


}
