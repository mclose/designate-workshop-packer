UNAME_S := $(shell uname -s)

all: packer clean files build

packer.zip:
ifeq ($(UNAME_S),Linux)
	curl -s -L -o packer.zip http://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip	
endif
ifeq ($(UNAME_S),Darwin)
	curl -s -L -o packer.zip http://dl.bintray.com/mitchellh/packer/packer_0.7.5_darwin_amd64.zip
endif

packer: packer.zip
	unzip -d packer packer.zip

clean:
	rm -rf output-* files.tar.gz

files:
	tar -czf files.tar.gz files

build: packer files
	./packer/packer build template.json

.PHONY: all clean files build
