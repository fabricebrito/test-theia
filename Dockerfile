FROM fabricebrito/theia-python:latest

RUN pip3 install \
    jhsingle-native-proxy>=0.0.10

COPY  entrypoint.sh /home/theia

RUN chmod +x /home/theia/entrypoint.sh

EXPOSE 8888

ENTRYPOINT ["/home/theia/entrypoint.sh"]

CMD ["jhsingle-native-proxy", "--destport", "8505", "/home/theia/src-gen/backend/main.js", "/home/project", "{--}hostname=0.0.0.0" "{--}port={port}"]



