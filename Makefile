IN_ENV = if [ -e .venv/bin/activate ]; then . .venv/bin/activate; fi;


install: packages install_wafove venv python_packages install_fasm2bels install_yosys

venv:
	python3 -m venv .venv
	$(IN_ENV) python3 -m pip install -U pip

packages:
	sudo apt-get install -y \
		make \
		python3-dev \
		python3-venv \
		python3-pip \
		virtualenv \
		libncurses5 \
		swig \
		python3-venv \
		default-jre-headless \
		uuid-dev \
		libantlr4-runtime-dev \
		openjdk-19-jdk \
		capnproto \
		libcapnp-dev \
		jq
	
python_packages:
	$(IN_ENV) python3 -m pip install -r requirements.txt

capnproto_java:
	$(eval TEMP_DIR := $(shell mktemp -d))
	cd $(TEMP_DIR) && git clone https://github.com/capnproto/capnproto-java
	cd $(TEMP_DIR)/capnproto-java && make
	cd $(TEMP_DIR)/capnproto-java && sudo make install
	rm -rf $(TEMP_DIR)

rapidwright:
	cd third_party && wget http://www.rapidwright.io/docs/_downloads/rapidwright-installer.jar
	cd third_party && java -jar rapidwright-installer.jar -t
	cd third_party/RapidWright && git submodule init
	cd third_party/RapidWright && git submodule update
	cd third_party/RapidWright/interchange && make
	cd third_party/RapidWright && make

submodules:
	git submodule init
	git submodule update

install_fasm2bels: submodules
	cd third_party/fasm2bels && make env
	$(IN_ENV) cd third_party/fasm2bels && make build
	cd third_party/fasm2bels && make test-py

install_wafove: submodules
	$(IN_ENV) python3 -m pip install -e third_party/WaFoVe
	$(IN_ENV) cd third_party/WaFoVe && make install

env:
	echo "if [ -f \"`pwd`/third_party/rapidwright.sh\" ]\nthen" > "env.sh" 	
	echo ". `pwd`/third_party/rapidwright.sh" >> "env.sh"
	echo "fi" >> "env.sh"
	echo "export INTERCHANGE_SCHEMA_PATH=`pwd`/third_party/RapidWright/interchange/fpga-interchange-schema/interchange" >> "env.sh"
	echo "export VIVADO_PATH=/tools/Xilinx/Vivado/2022.2/bin/vivado" >> "env.sh"

install_yosys:
	# Yosys
	sudo apt-get install -y \
		build-essential \
		clang \
		bison \
		flex \
		libreadline-dev \
		gawk \
		tcl-dev \
		libffi-dev \
		graphviz \
		xdot \
		pkg-config \
		libboost-system-dev \
		libboost-python-dev \
		libboost-filesystem-dev \
		zlib1g-dev

	cd third_party/yosys && make -j8


format:
	find ./scripts -iname "*.py" -exec black -l 100 {} \;

pylint:
	pylint $$(git diff --name-only $$(git merge-base main HEAD) | grep -e ".py$$")


pylint:
	git fetch
	pylint $$(git diff --name-only $$(git merge-base origin/main HEAD) | grep -e ".py$$")

