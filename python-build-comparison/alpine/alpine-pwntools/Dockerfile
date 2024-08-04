FROM alpine:3.7
RUN apk add --no-cache musl-dev gcc python3 python python3-dev python-dev libffi-dev libcap-dev make curl git pkgconfig openssl-dev bash alpine-sdk
RUN python -m ensurepip --upgrade
RUN pip3 install --upgrade pip

# Install latest cmake
RUN git clone https://github.com/Kitware/CMake.git && cd CMake && ./bootstrap && make && make install
ENV PATH=$PATH:/usr/local/bin

# setup rust
RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf > setup-rust.sh
RUN bash setup-rust.sh -y
ENV PATH=$PATH:/root/.cargo/bin


RUN pip3 install cryptography bcrypt capstone zstandard psutil urllib3 sortedcontainers six pynacl pygments plumbum MarkupSafe idna charset-normalizer
RUN pip3 install unicorn certifi unix-ar rpyc ropgadget requests python-dateutil pysocks pyserial pyelftools psutil paramiko packaging mako intervaltree colored-traceback
# RUN git clone https://github.com/capstone-engine/capstone.git && cd capstone && ./make.sh && make install
# RUN git clone https://github.com/unicorn-engine/unicorn.git && cd unicorn && mkdir build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release && make && make install
# wget https://github.com/unicorn-engine/unicorn/archive/2.0.1.zip && unzip

RUN pip3 install pwn
COPY vulnerable.c /vulnerable.c
COPY payload /payload
COPY poc.py /poc.py
RUN gcc -o /vulnerable_musl /vulnerable.c -O2 -D_FORTIFY_SOURCE=3