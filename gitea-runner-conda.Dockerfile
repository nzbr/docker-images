FROM gitea/runner-images:ubuntu-latest

# Install conda
RUN wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" && \
    bash Miniforge3.sh -b && \
    rm Miniforge3.sh

# Setup shell hooks
# Cleanup .bashrc first (it is normally skipped in non-interactive shells)
RUN echo "" > /root/.bashrc && /root/miniforge3/condabin/conda init bash && /root/miniforge3/condabin/mamba init bash
