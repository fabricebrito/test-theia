FROM fabricebrito/theia-python:latest

RUN pip3 install \
    jhsingle-native-proxy>=0.0.10

COPY  entrypoint.sh /home/theia

RUN chmod +x /home/theia/entrypoint.sh

EXPOSE 8888

RUN chmod -R 777 /home/theia/

ENTRYPOINT ["/home/theia/entrypoint.sh"]

CMD ["jhsingle-native-proxy", "--port", "8888", "--destport", "8505", "node", "/home/theia/src-gen/backend/main.js", "/home/project", "{--}hostname=0.0.0.0" "{--}port={port}"]


# binderhub-streamlit-native
# CMD ["jhsingle-native-proxy", "--destport", "8505", "streamlit", "hello", "{--}server.port", "{port}", "{--}server.headless", "True", "{--}server.enableCORS", "False", "--port", "8888"]


# binderhub-voila-direct
# ENTRYPOINT ["/home/jovyan/entrypoint.sh"]
# no CMD

# binderhub-voila-native
# CMD ["jhsingle-native-proxy", "--destport", "8505", "voila", "/home/jovyan/Presentation.ipynb", "{--}port={port}", "{--}no-browser", "{--}Voila.base_url={base_url}/", "{--}Voila.server_url=/"]

