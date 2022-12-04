#/bin/bash

mkdir -p /go/src/github.com /go/src/gitlab.com/kiktbackend /go/src/gitlab.com/kiktlib /go/bin /go/pkg
cd /go/src/gitlab.com/kiktlib
git clone https://gitlab.com/kiktlib/database.git
git clone https://gitlab.com/kiktlib/configreader.git
git clone https://gitlab.com/kiktlib/log.git
git clone https://gitlab.com/kiktlib/x.git

cd /go/src/gitlab.com/kiktbackend
git clone https://gitlab.com/kiktbackend/cbs.git
cd cbs
rm go.sum