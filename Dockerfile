FROM docker.io/fabricebrito/theia-python:18.1.0-bullseye

RUN pip3 install \
    jhsingle-native-proxy>=0.0.10

COPY  entrypoint.sh /home/theia

RUN chmod +x /home/theia/entrypoint.sh

EXPOSE 8888

RUN chmod -R 777 /home/theia/

ENTRYPOINT ["/home/theia/entrypoint.sh"]

CMD ["jhsingle-native-proxy", "--port", "8888", "--destport", "8505", "node", "/home/theia/src-gen/backend/main.js", "/workspace", "{--}hostname=0.0.0.0" "{--}port={port}"]

