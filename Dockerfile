FROM pytorch/pytorch:latest

# Install required libraries
RUN conda config --add channels pytorch \
 && conda config --append channels conda-forge \
 && conda update --all --yes --quiet \
 && conda install --yes --quiet \
    ipywidgets \
    jupyterlab \
    matplotlib \
    "nodejs>=12.0" \
    opencv \
    pandas \
    scikit-learn \
    seaborn \
    sympy \
 && conda clean --all -f -y

# Install jupyter extensions
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension \
 && jupyter labextension install @jupyter-widgets/jupyterlab-manager

COPY jupyter_notebook_config.py /root/.jupyter/
