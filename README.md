docker-postfix
==============

Builds a simple "SMTP Only" postfix image.

Emails can be sent only from localhost addresses:

 - 127.0.0.0/8
 - [::ffff:127.0.0.0]/104
 - [::0]/128
 
Start the image and include your (docker) hosts DNS entry. e.g.

`docker run -d --name postfix -p 25:25 --restart always citizen010/postfix mail.example.com`

Where the first 25 is the local port and the second 25 is the container port.

This images is available on [docker hub](https://hub.docker.com/r/citizen010/postfix) and can be downloaded by running

`docker pull citizen010/postfix`

