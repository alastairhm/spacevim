FROM ubuntu:22.04 as base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y upgrade && apt-get -y install --no-install-recommends curl git build-essential pip neovim && \
    git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && \
    cd ~/.vim/bundle/vimproc.vim && \
    make && \
    pip3 install --no-cache-dir --upgrade msgpack && \
    rm -rf /var/lib/apt/lists/*

FROM base
ENV HOME /home/spacevim

RUN groupdel users                            \
    && groupadd -r spacevim                   \
    && useradd --create-home --home-dir $HOME \
            -r -g spacevim                    \
            spacevim

USER spacevim

WORKDIR $HOME
ENV PATH "$HOME/.local/bin:${PATH}"

RUN mkdir -p $HOME/.config $HOME/.SpaceVim.d $HOME/workdir
COPY --chown=spacevim:spacevim init.toml $HOME/.SpaceVim.d
RUN curl -sLf https://spacevim.org/install.sh | bash && \
    nvim --headless +'call dein#install()' +qall
WORKDIR $HOME/workdir
ENTRYPOINT ["/usr/bin/nvim"]

