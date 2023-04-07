FROM python:3

WORKDIR /github

ARG USERNAME=u1

# Add user u1
RUN useradd -b /home/ -m $USERNAME

USER $USERNAME

ENV PATH=$PATH:/home/$USERNAME/.local/bin

#COPY requirements-scikit-image.txt ./requirements.txt
RUN pip install --no-cache-dir scikit-image
# matplotlib needs to be installed after numpy has been fully installed
RUN pip install --no-cache-dir matplotlib

