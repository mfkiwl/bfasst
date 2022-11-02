# Creates the .yos script that is used by yosys to compile the project
import sys
import getopt
import os

usage_str = 'createPrjFile.py -s <source files> -o <yos file> -i <input yos file> -v <output netlist name>\n\
Multiple source files must be enclosed in quotes \n\
  ex createPrjFile.py -s "src1.v src2.v"\
If -o is not specified, prints to stdout'


def print_or_write(outfile, string):
    if outfile != None:
        outfile.write(string)
    else:
        print(string, end="")


def main():
    # Read and parse args
    outfile = None
    srcs = None
    inyos = None
    out_netlist = None
    try:
        opts, args = getopt.getopt(sys.argv[1:], "-hs:o:i:v:", ["help"])
    except getopt.GetoptError as err:
        print(err)
        print(usage_str)
        sys.exit(2)
    for o, a in opts:
        if o in ("-h", "--help"):
            print(usage_str)
        elif o == "-s":
            srcs = a.split()
        elif o == "-o":
            outfile = a
        elif o == "-i":
            inyos = a
        elif o == "-v":
            out_netlist = a
        else:
            assert False, "unhandled option"

    # Read the example yos file and replicate most of it. Replace the
    #   project files with our source files
    of = None
    if outfile != None:
        try:
            of = open(outfile, "w")
        except IOError:
            print("Could not open output file!")
            sys.exit(2)

    with open(inyos) as prj_file:
        for line in prj_file:
            print_or_write(of, line)
            if line.strip() == "# Read verilog input files":
                for src in srcs:
                    if src[-4:] == ".vhd":
                        # Yosys doesn't natively support VHDL.
                        # print("Ignoring VHDL file", src, " -- VHDL not supported")
                        print_or_write(of, "read_vhdl " + src + "\n")
                    elif src[-2:] == ".v" or src[-3:] == ".vh":
                        print_or_write(of, "read_verilog " + src + "\n")
                    else:
                        print("Unrecognized file type", src)
            if line.strip() == "# Run xilinx synthesis passes":
                # print_or_write(of, "synth_xilinx -edif " + "yosys.edif" + "\n")
                import pathlib
                print_or_write(of, "synth_xilinx -edif " + pathlib.Path(src).stem + ".edf" + " -top " + pathlib.Path(src).stem + "\n")
            if line.strip() == "# Now write the verilog output":
                print_or_write(of, "write_verilog " + out_netlist + "\n")
    print_or_write(of, "\n")


if __name__ == "__main__":
    main()
