# docker-experiments

A repository to host the artifacts of my experiments with Docker.


Currently there are 4 docker files.
  - `alpine-gui` derives from `alpine:latest`. It adds fonts to the base image so that GUI applications can render the text. In absense of fonts, GUI applications display tofu characters.
  - `firefox` derives from `alpine-gui`. The only [and the obvious] addition is the firefox browser.
  - `pytorch` derives from `python:3`. It adds `torch`, `torchvision`, `torchaudio`, and `matplotlib` modules to the base image. 
  - `scikit` derives from `python:3`. It adds `scikit-learn`, `scikit-image`, and `matplotlib` modules to the base image.


There are also a few convenience scripts.
  - `ff.sh` launches firefox container with the given context name. A context name is effectively an instance of firefox isolated from other instances. Each firefox instance has an isolated cookie store, history, settings & preferences, bookmarks, password store, extensions etc. 
  - `ffm.sh` is a convinence script to a launch Firefox container using "main" context.
  - `runpy.sh` launches a container of the scpecified image and runs the specified command. While the script is pretty generic conceptually, it is configured to run the python images - `pytorch` and `scikit`.


For more details, please read the scripts. Note that these scripts have been written to run on Debian OS. Also a specific directory structure is assumed. You may want to change them to suit your OS as well as the rest of your environment.


Finally, there is a `notes.txt` file which is basically a dumping ground for notes and snippets of code/commands.
