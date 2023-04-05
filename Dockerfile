FROM devisty/xssh:v2
EXPOSE 80

COPY . /app
RUN #chmod +x /app/start.sh
RUN chmod +x /app/install.sh
#CMD ["/app/start.sh"]
CMD ["/app/install.sh"]
