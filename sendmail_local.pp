class sendmail_local ($relay = ["Connect:localhost.localdomain           RELAY",
				"Connect:localhost                       RELAY",
				"Connect:127.0.0.1                       RELAY",
				
					],
	) {



file { "/etc/mail/access":
                owner => "root",
                group => "root",
                mode => "0644",
                content => template("cis/access.erb"),
		notify => Service["sendmail"],
        }
}
