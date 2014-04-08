define image_file ($seek = '',
                   $path = '',
                   $of = $name,
                   $bs = '1024',
                   $count = '0',
                   ) {


        exec {"create image file${name}":
                command => "dd if=/dev/zero of=${path}${name}.img bs=${bs} count=${count} seek=$[1024*${seek}]",
                timeout => 1000,
                path    => "/bin/:/usr/bin/",
                creates => "${path}${name}.img",
        }

}

class partition_image {
        image_file {'tmp':
                seek => '100',
                path => '/',
        }
	image_file {'var':
                seek => '100',
                path => '/',
        }


	mount { "/var/tmp":
        	device  => "/tmp",
        	fstype  => "none",
        	ensure  => "mounted",
        	options => "rw,noexec,nosuid,nodev,bind",
        	atboot  => "true",
	}

	 mount { "/dev/shm":
                device  => "tmpfs",
                fstype  => "tmpfs",
                ensure  => "mounted",
                options => "rw,noexec,nosuid,nodev",
                atboot  => "true",
        }




}




