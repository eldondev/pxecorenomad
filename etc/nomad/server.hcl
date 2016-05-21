# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/server1"

bind_addr = "192.168.249.1"
advertise {
	     rpc = "192.168.249.1:4647"
	     }
	
server {
    enabled = true

    # Self-elect, should be 3 or 5 for production
    bootstrap_expect = 1
}
