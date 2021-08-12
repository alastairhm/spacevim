FROM ubuntu:21.10 as base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y upgrade && apt -y install curl git build-essential pip neovim && \
    git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim && \
    cd ~/.vim/bundle/vimproc.vim && \
    make && \
    rm -rf /var/lib/apt/lists/*

FROM base
ENV HOME /home/spacevim

RUN groupdel users                                              \
  && groupadd -r spacevim                                       \
  && useradd --create-home --home-dir $HOME                     \
             -r -g spacevim                                     \
             spacevim

USER spacevim

WORKDIR $HOME
ENV PATH "$HOME/.local/bin:${PATH}"

RUN mkdir -p $HOME/.config $HOME/.SpaceVim.d $HOME/workdir
COPY init.toml $HOME/.SpaceVim.d
RUN curl -sLf https://spacevim.org/install.sh | bash && \
    nvim --headless +'call dein#install()' +qall
ENTRYPOINT ["/usr/bin/nvim"]

