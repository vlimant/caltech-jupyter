#General guidelines on using the GPU servers at caltech

Here is a description of the machines
```
titans.hep.caltech.edu has 2 Titan GPU
imperium-sm.hep.caltech.edu has 8 GTX1080 GPU
culture-plate.hep.caltech.edu has 8 GTX1080 GPU
passed-pawn-kmlx.hep.caltech.edu has 8 TitanX GPU
```

#User Instructions

## Keras
Users should either update the .keras/keras.json to specify the backend of preference or use environment setup in python
```
import os
os.environ['KERAS_BACKEND'] = 'theano'
os.environ['KERAS_BACKEND'] = 'tensorflow'
import keras

## Theano
Depending on the machine and the version of theano installed, you should have different version of .theanorc
On machines with theano 0.8 (e.g. titans)
```
[nvcc]
fastmath=True
flags =  -arch=sm_30
[global]
device=gpu
```

On machines with theano 0.9 (e.g. the others)
```
[global]
device=cuda
floatX=float32
```

## Tensorflow
To limit the amount of memory allocated on the GPUs by tensorflow, you should use
```
Dustin ?
```
To restrict the computation to the CPU, you can set
```
import os
os.environ['CUDA_VISIBLE_DEVICES']=""
import tensorflow as tf
```

## Jupyter notebooks
Each user has to start it's own notebook server, we recommend using screen and
```
/etc/jupyter/restart.sh
```

One can then access it at
```
https://<server name>:<port>
```
where the port is provided in /etc/jupyter/port

## Storage
There is a disk server mounted on all machines under /bigdata , if you don't have a directory there, let one of the admin know.


#Admin settings

## Notebooks
## Groups
## GPUs