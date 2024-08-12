FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    sudo \
    wget \
    vim \
    build-essential

WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2022.10-Linux-x86_64.sh && \
	bash Anaconda3-2022.10-Linux-x86_64.sh -b -p /opt/anaconda3 && \
	rm -f Anaconda3-2022.10-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH

COPY requirements.txt /root/

RUN pip install --upgrade pip && pip install -r /root/requirements.txt

WORKDIR /work
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]