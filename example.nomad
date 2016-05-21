job "example" {
	datacenters = ["dc1"]
	constraint {
		attribute = "${attr.kernel.name}"
		value = "linux"
	}
	group "bbserve" {
		restart {
			attempts = 10
			interval = "5m"
			delay = "25s"
			mode = "delay"
		}
		task "bbhttpd" {
			driver = "docker"
			config {
				image = "busybox"
				command = "httpd"
				args = [ "-fvv" ]
			}
			resources {
				network {
					mbits = 1
					port "http" {
						static = 80
					}
				}
			}
		}
	}
}
