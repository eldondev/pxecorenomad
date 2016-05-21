job "example" {
	# Specify the datacenters within the region this job can run in.
	datacenters = ["dc1"]

		constraint {
		attribute = "${attr.kernel.name}"
		value = "linux"
	}

	# Configure the job to do rolling updates
	update {
		# Stagger updates every 10 seconds
		stagger = "10s"

		# Update a single task at a time
		max_parallel = 1
	}

	# Create a 'cache' group. Each task in the group will be
	# scheduled onto the same machine.
	group "cache" {
		# Control the number of instances of this groups.
		# Defaults to 1
		# count = 1

		# Configure the restart policy for the task group. If not provided, a
		# default is used based on the job type.
		restart {
			# The number of attempts to run the job within the specified interval.
			attempts = 10
			interval = "5m"
			
			# A delay between a task failing and a restart occurring.
			delay = "25s"

			# Mode controls what happens when a task has restarted "attempts"
			# times within the interval. "delay" mode delays the next restart
			# till the next interval. "fail" mode does not restart the task if
			# "attempts" has been hit within the interval.
			mode = "delay"
		}

		# Define a task to run
		task "redis" {
			# Use Docker to run the task.
			driver = "docker"

			# Configure Docker driver with the image
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
