FROM gitpod/workspace-full:branch-at-remove-pip-user

USER root
RUN apt-get update && apt-get install -y \
        xfonts-utils \
        neovim python3-neovim \
    && apt-get purge -y vim \
    && apt-get autoremove -y \
    && apt-get autoclean

USER gitpod
RUN curl -sLf https://spacevim.org/install.sh | bash \
    && nvim --headless +'call dein#install()' +qall

RUN pip3 install pelican ipython

# Give back control
USER root
