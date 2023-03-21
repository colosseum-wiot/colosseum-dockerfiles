#==================================================================================
#       Copyright (c) 2022 Northeastern University
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#          http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#==================================================================================

FROM ubuntu:20.04 as buildenv
ARG password=ChangeMe

# Set timezone
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y openssh-server htop nano

# These are required to enable ssh connection to use it on colosseum
RUN ssh-keygen -A
RUN mkdir -p /run/sshd
RUN echo "root:${password}" | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config


WORKDIR /workspace

# This command will be always overwritten by the system
CMD ["/usr/sbin/sshd", "-D"]
