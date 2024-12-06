FROM gitpod/workspace-base:2024-09-12-15-52-34
RUN sudo apt-get update && sudo apt-get install -y docker-buildx-plugin sqlite wget 

# RUN echo 'alias home="cd ${GITPOD_REPO_ROOT}"' | tee -a ~/.bashrc ~/.zshrc
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

RUN . "$HOME/.asdf/asdf.sh"
RUN . "$HOME/.asdf/completions/asdf.bash"

RUN wget https://github.com/gleam-lang/gleam/releases/download/v1.6.3/gleam-v1.6.3-x86_64-unknown-linux-musl.tar.gz
RUN tar -xzvf gleam-v1.6.3-x86_64-unknown-linux-musl.tar.gz
RUN mv gleam /usr/local/bin

RUN export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
RUN asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf install erlang 27.1.2


# fly
RUN curl -L https://fly.io/install.sh | sh
ENV FLYCTL_INSTALL="/home/gitpod/.fly"
ENV PATH="$FLYCTL_INSTALL/bin:$PATH"


# install doppler locally.
RUN (curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh

RUN go install github.com/mailhog/MailHog@latest


# alias all the things
RUN echo 'alias home="cd ${GITPOD_REPO_ROOT}"' | tee -a ~/.bashrc ~/.zshrc

