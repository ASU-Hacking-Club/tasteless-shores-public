FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y \
    lib32z1 xinetd

RUN useradd -s /bin/bash -m ctf

WORKDIR /home/ctf

# copy in xinetd files to start server
COPY ./utils/ctf.xinetd /etc/xinetd.d/ctf
COPY ./utils/start.sh /start.sh
RUN chmod +x /start.sh 
RUN echo "Blocked by ctf_xinetd" > /etc/banner_fail

# copy all public files
COPY ./public/* /home/ctf/
COPY ./flag.txt /home/ctf/flag.txt
RUN chown -R root:ctf /home/ctf && \
    chmod -R 750 /home/ctf

# update the permissions of the challenge binary to drop into root 
# while its running. This allows you read root owned flag
# WARNING: if you are mounting any folder it is strongly reccomended
# that you make a second user that owns flag that is not root! 
RUN chmod u+s /home/ctf/server

# set perms of flag as a special file only readable by root 
RUN chmod 400 /home/ctf/flag.txt

CMD ["/start.sh"]
EXPOSE 31337
