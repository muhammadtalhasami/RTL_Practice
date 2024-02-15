export CORE_ROOT=/home/talha/practice/OPEN_LANE

all: icarus

icarus: icarus_compile
	vvp $(CORE_ROOT)/temp/dff.out

icarus_compile:
	mkdir -p temp
	iverilog -f flist -o $(CORE_ROOT)/temp/dff.out

clean:
	rm -rf temp