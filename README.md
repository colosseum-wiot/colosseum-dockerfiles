# Colosseum Dockerfiles for GPUs Utilization

This public repository contains a set of Dockerfiles that can be used to create basic Docker images ready to use for the Colosseum environment.<br><br>
Each Dockerfile contains the minimum requirements to properly work in Colosseum together with a few best practices:
- Timezone setting to America/New York;
- _OpenSSH_ installation;
- Enabling _ssh_ with the root user (default password is `ChangeMe`);
- Deletion of apt libraries to reduce final image size;
- Various package installations based on the type of final image.

## How to use

In order to build a Docker image from a Dockerfile, at least [Docker](https://www.docker.com/) needs to be installed and running on your computer. 

You can build a Docker image by running the `docker build` command with the following parameters:
- `--platform linux/amd64` to specify the correct image architecture (needed if building the image with a MAC M1/M2 for example);
- `-t <image-name>:<image-tag>` to set a name and a tag for the image;
- `-f <dockerfile-name>` to input the Dockerfile to build the image from;
- `<build-context-path>` to set the path for the build context, i.e. the set of files and directories that are used to build a Docker image.

As an example, a whole Docker build command is the following:

`docker build --platform linux/amd64 -t example:1.0 -f Dockerfile_base .`

More information on Dockerfiles can be found in [4], while [5] provides best practices on how to properly write Dockerfiles.

## List of Dockerfiles

| Title                                     | Dockerfile                                   | Notes                                                                                                                                                                |
|-------------------------------------------|----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Base                                      | Dockerfile_base<br/>Dockerfile_base_squashed | Base Dockerfiles (non-squashed and squashed for a lighter and compressed layered image) with just the minimum requirements for working in the Colosseum environment. |
| [PyTorch](https://pytorch.org/)           | Dockerfile_pytorch                           | Base image with [PyTorch](https://pytorch.org/) installed.                                                                                                           |
| [TensorFlow](https://www.tensorflow.org/) | Dockerfile_tensorflow                        | Base image with [TensorFlow](https://www.tensorflow.org/) installed.                                                                                                 |

## References

[1] [Colosseum Public Website](https://www.northeastern.edu/colosseum/)

[2] [Colosseum Experiments Website](https://experiments.colosseum.net/)

[3] [Colosseum FreshDesk Page](https://colosseumneu.freshdesk.com/support/home)

[4] [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

[5] [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)