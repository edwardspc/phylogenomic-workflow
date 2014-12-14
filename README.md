Phylogenomic Workflow deployed on Hadoop
----------------------------------------
This is an ongoing project porting SciPhylomic Workflow to be deployed on Hadoop.

## Part 1: SciPhy Workflow
-------------------------

Dependencies
------------
1. MAFFT

```bash
$ wget http://mafft.cbrc.jp/alignment/software/mafft-7.205-gcc_fc6.x86_64.rpm
$ sudo rpm -Uvh mafft-7.205-gcc_fc6.x86_64.rpm
```

http://mafft.cbrc.jp/alignment/software/linux.html

2. RAxML

```bash
$ git clone https://github.com/stamatak/standard-RAxML.git
$ cd standard-RAxML
$ make -f Makefile.gcc
$ echo "export RAXMLHPC_HOME=`pwd`" >> ~/.bashrc
$ source ~/.bashrc
$ sudo ln -s $RAXMLHPC_HOME/raxmlHPC /usr/local/bin/raxmlHPC
```

https://github.com/stamatak/standard-RAxML

Example SciPhy
---------------
$ ./sciphy.sh

Reference
---------
Performance evaluation of parallel strategies in public clouds: A study with phylogenomic workflows
http://www.sciencedirect.com/science/article/pii/S0167739X13000034

