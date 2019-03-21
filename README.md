
# oci-squid
## Containerized squid proxy server

Simple squid container image.
### Setting up the squid in container
 - Build an image from dockerfile:

		docker build --rm -t oci-squid:latest .
- Run a container and map container's squid port to host:
		
		docker run -dit --name oci-squid-run -p 3128:3128 oci-squid
### Verify the set up with ie.:
- Connect to the container with:

		docker exec -it oci-squid-run bash
- And output the squid log file:

		tail -f /var/log/squid/access.log
- Open another terminal and run:

		curl -Is --proxy <ip-to-host>:3128 http://httpbin.org
- You should get 200 status code on http response:

		HTTP/1.1 200 OK
- Check output from squid access.log, should be something like this:

		1553159630.475     85 XX.XX.XX.XX TCP_MISS/200 342 HEAD http://httpbin.org/ - HIER_DIRECT/XX.XX.XX.XX text/html

