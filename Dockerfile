FROM ubuntu:latest

ARG USER=${USER}

# Install basic components for SSH access
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y sudo openssh-server

# Create admin user
RUN useradd -m ${USER}; adduser ${USER} sudo; echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/sudoers

# Configure SSH access with public key is resources directory
USER ${USER}
RUN mkdir ~/.ssh; chmod 700 ~/.ssh; 
COPY --chown=${USER}:sudo id_rsa.pub /home/${USER}/.ssh/id_rsa.pub
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys; chmod 644 ~/.ssh.id_rsa.pub; chmod 644 ~/.ssh/authorized_keys

# Start SSH service
USER root
RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]