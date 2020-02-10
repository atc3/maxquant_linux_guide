MaxQuant for Linux Guide
========================

Read my blog post here: [http://atchen.me/research/2019/03/21/mq-linux.html](http://atchen.me/research/2019/03/21/mq-linux.html)

The goal of the `gen_mqpar.py` script is to create MaxQuant configuration files (`mqpar.xml` files) in a console environment without having to transfer one over or edit the XML manually. The example given has some hard-coded stuff and makes assumptions about your filesystem, so please follow the steps below to get started.

1. Verify that [Mono](https://www.mono-project.com/download/stable/#download-lin) is installed.

Note, If searching Bruker timsTOF data, you need `gcc` version 8.3+. Check the version with `gcc --version`. You can install gcc8 with these commands:

```bash
# For CentOS 7:

yum install centos-release-scl
yum install devtoolset-8
scl enable devtoolset-8 -- bash

# Enable the tools (put this into .bash_profile)
source /opt/rh/devtoolset-8/enable
```

(Thanks to [@cscaife](https://github.com/cscaife) for identifying this step, and [https://stackoverflow.com/a/55876012](https://stackoverflow.com/a/55876012) for the install instructions)

2. Create template `mqpar.xml` files – representing configurations for MaxQuant searches you routinely run on your experiments. I put a bunch of my templates in a folder, `templates/` for easy access. 
    - I recommend generating these first in the MaxQuant GUI, as it's easier and you can verify that the configuration file is valid before moving it to your Linux instance.
    - Don't worry about the raw files, folder paths, or FASTA file paths in the template file – they will be replaced by the script
3. Move the MaxQuant files onto your Linux instance. My setup has MaxQuant versions separately in a folder `MQ/`, i.e., `MQ/MaxQuant_1_7_0`. I then map this path to an environment variable in my `.bash_profile`, with `export MQ_1_7_0=~/MQ_1_7_0/bin/MaxQuantCmd.exe`. You can manage your MaxQuant versions however you like, just make sure that it's reflected in the `gen_mqpar.py` script.
4. Move your protein FASTA files over to the Linux instance. The current `gen_mqpar.py` script has the path to the FASTA file hard-coded, and it's straightforward to change this or make it argument-driven.

Run:
```bash
./gen_mqpar.py <path/to/template> <path/to/raw_file_folder> -o <path/to/output_mqpar.xml> -t <num_threads>
# for example,
./gen_mqpar.py templates/SILAC.xml raw_files/FP93 -o fp93_silac.xml -t 6

```

If you're getting errors with starting MaxQuant with the generated `mqpar` files, then I would manually check all of the paths in the XML file first.

