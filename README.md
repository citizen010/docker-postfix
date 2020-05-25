# docker-postfix - integration into BTCPayServer

A simple "SMTP Only" postfix image.

Emails can be sent everywhere but only from localhost addresses:

 - 127.0.0.0/8
 - 172.16.0.0./12
 - [::1]/128
 
Start the image and include your hosts DNS entry as below:

`docker run -d --name postfix -p 25:25 --restart always citizen010/postfix btcpay.domain.name`

Where the first 25 is the local port and the second 25 is the container port.

Remember to change __btcpay.domain.name__ with your own domain name.

This images is available on [docker hub](https://hub.docker.com/r/citizen010/postfix) and can be downloaded by running

`docker pull citizen010/postfix`

# How to find out which Postfix version I'm running

SSH into the machine that host your BTCPayServer instance and run:

`docker exec -it postfix /bin/bash`

`postconf mail_version`

You should see something like this:

`mail_version = 3.3.0`

Then exit:

`exit`

# BTCPayServer config

Go to __Server Settings__ -> __Email server__ and fill as below:

- __SMTP Server__: your external IP address (to find out: `curl -s ipinfo.io/ip`)
- __PORT__: 25
- __Sender's display name__: whatever (e.g. BTCPay Store)
- __Sender's email address__: youchoose@btcpay.domain.name (e.g. store@btcpay.domain.name)
- __Login__: empty
- __Password__: empty
- __Enable SSL__: not checked
- __Test Email__: yourname@yourisp.com

Press __Send Test Email__

You should see __Email sent to yourname@yourisp.com, please, verify you received it__  and then check (also on Spam folder) if a test email was received.

Press __Save__

If you see an error message (eg. error 4.7.1) double check the parameters and try again.
