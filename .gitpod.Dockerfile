FROM gitpod/workspace-full:2024-12-04-13-05-19
RUN sudo apt-get update && sudo apt-get install -y docker-buildx-plugin sqlite wget 


# RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1

# RUN /bin/bash -c 'echo -e "\n\n## Configure ASDF \n. $HOME/.asdf/asdf.sh" >> ~/.bashrc'; \
#     /bin/bash -c 'echo -e "\n\n## ASDF Bash Completion: \n. $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc'; \
#     exec bash; 
RUN brew install asdf
# RUN export ASDF_HOME=$HOME/.asdf
# RUN /bin/bash -c . "$HOME/.asdf/asdf.sh"
# RUN . "$HOME/.asdf/completions/asdf.bash"

RUN export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
# RUN asdf plugin add erlang && \
#     asdf plugin add elixir && \
#     asdf plugin add postgres
  
RUN asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
RUN asdf plugin-add rebar https://github.com/Stratus3D/asdf-rebar.git
RUN asdf plugin-add gleam

# install our versions

ENV GLEAM_VERSION=20.17.0
ENV ERLANG_VERSION=20.17.0
ENV REBAR_VERSION=20.17.0
RUN echo "gleam ${GLEAM_VERSION}\nerlang ${ERLANG_VERSION}\nrebar ${REBAR_VERSION}" | tee -a .tool-versions
RUN asdf install 

# fly
RUN curl -L https://fly.io/install.sh | sh
ENV FLYCTL_INSTALL="/home/gitpod/.fly"
ENV PATH="$FLYCTL_INSTALL/bin:$PATH"


# install doppler locally.
RUN (curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh

# RUN go install github.com/mailhog/MailHog@latest


# alias all the things
RUN echo 'alias home="cd ${GITPOD_REPO_ROOT}"' | tee -a ~/.bashrc ~/.zshrc

