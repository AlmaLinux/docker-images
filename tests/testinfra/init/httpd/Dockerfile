ARG SYS_INIT
FROM ${SYS_INIT} 
RUN dnf -y install httpd which initscripts; \
    dnf clean all; \
    systemctl enable httpd;
RUN echo "AlmaLinux HTTPD Server <br />Page works" > /var/www/html/index.html
RUN mkdir /etc/systemd/system/httpd.service.d/; \
    echo -e '[Service]\nRestart=always' > /etc/systemd/system/httpd.service.d/httpd.conf
EXPOSE 80
CMD [ "/sbin/init" ]