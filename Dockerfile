FROM sagemath/sagemath:latest

RUN sage -pip install pycryptodome
RUN sage -pip install pwntools