# docker-experiments

A repository to host the artifacts of my experiments with Docker.


Currently there are following docker files.
  - `firefox` derives from `alpine:latest`, and adds Firefox browser and fonts. Fonts are required so that GUI applications can render the text. In absense of fonts, GUI applications display tofu characters.
  - `python-audio` derives from `python:3`. It adds `numpy`, `scipy`, `pandas`, `matplotlib`, `librosa`, and `essentia` modules to the base image. 
  - `python-base` derives from `python:3`. It adds `numpy`, `scipy`, `pandas`, and `matplotlib` modules to the base image. 
  - `pytorch` derives from `python:3`. It adds `torch`, `torchvision`, `torchaudio`, and `matplotlib` modules to the base image. 
  - `scikit` derives from `python:3`. It adds `scikit-learn`, `scikit-image`, and `matplotlib` modules to the base image.


There are also a few convenience scripts.
  - `ff.sh` launches firefox container with the given context name. A context name is effectively an instance of firefox isolated from other instances. Each firefox instance has an isolated cookie store, history, settings & preferences, bookmarks, password store, extensions etc. 
  - `runpy.sh` launches a container of the scpecified image and runs the specified command. While the script is pretty generic conceptually, it is configured to run the python images - `pytorch` and `scikit`.
  - `update.sh` rebuilds `firefox` and `python-base` containers, effectively upgrading the container OS and applications with latest updates.

For more details, please read the scripts. Note that these scripts have been written to run on Debian OS. Also a specific directory structure is assumed. You may want to change them to suit your OS and the rest of your environment.


Finally, there is a `notes.txt` file which is basically a temporary dumping ground for notes and snippets of code/commands. Eventually, some of the content in this file may find a permanent home in some script or markdown file.

