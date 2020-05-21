## docker-postfix - built for integration with BTCPayServer

A simple "SMTP Only" postfix image.

Emails can be sent only from localhost addresses:

 - 127.0.0.0/8
 - 172.16.0.0./12
 - [::0]/128
 
Start the image and include your hosts DNS entry as below:

`docker run -d --name postfix -p 25:25 --restart always citizen010/postfix mail.example.com`

Where the first 25 is the local port and the second 25 is the container port.

Remember to change __mail.example.com__ with your own domain name.

This images is available on [docker hub](https://hub.docker.com/r/citizen010/postfix) and can be downloaded by running

`docker pull citizen010/postfix`

# BTCPayServer config

Go to __Server Settings__ -> __Email server__ and fill as below:

- __SMTP Server__: your external IP address
- __PORT__: 25
- __Sender's display name__: whatever (e.g. BTCPay Store)
- __Sender's email address__: youchoose@domain.name (e.g. store@domain.name)
- __Login__: empty
- __Password__: empty
- __Enable SSL__: not checked
- __Test Email__: yourname@yourisp.com

Press __Send Test Email__

If should see __Email sent to yourname@yourisp.com, please, verify you received it__  and go check if you received a test email.

Press __Save__

If you see an error message (eg. error 4.7.1) double check the parameters and try again.
