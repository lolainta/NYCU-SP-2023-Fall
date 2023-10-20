FROM sagemath/sagemath:latest

RUN sage -pip install pycryptodome
RUN sage -pip install pwntools
RUN sage -pip install tqdm
RUN sage -pip install ecdsa

WORKDIR /work

