FROM ghcr.io/alastairhm/ubuntu-base:latest

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

