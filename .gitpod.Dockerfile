FROM gitpod/workspace-full:2024-05-22-07-25-51

RUN sudo install-packages build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 \
        libncurses-dev libncurses5 libtinfo5 && \
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=1 BOOTSTRAP_HASKELL_MINIMAL=1 sh && \
    echo 'source $HOME/.ghcup/env' >> $HOME/.bashrc && \
    echo 'export PATH=$HOME/.cabal/bin:$HOME/.local/bin:$PATH' >> $HOME/.bashrc && \
    . /home/gitpod/.ghcup/env && \
    ghcup install ghc 9.6.5 --set && \
    ghcup install cabal --set && \
    cabal update && \
    cabal install --disable-executable-dynamic --install-method copy \
      ormolu hoogle ghcid && \
    rm -rf ~/.local/state/cabal