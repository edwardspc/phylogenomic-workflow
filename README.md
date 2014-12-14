Phylogenomic Workflow deployed on Hadoop
----------------------------------------
This is an ongoing project porting **SciPhylomics Workflow** to be deployed on Hadoop.

## Part 1: SciPhy Workflow

### Dependencies
#### MAFFT
```bash
$ wget http://mafft.cbrc.jp/alignment/software/mafft-7.205-gcc_fc6.x86_64.rpm
$ sudo rpm -Uvh mafft-7.205-gcc_fc6.x86_64.rpm
```
[mafft] (http://mafft.cbrc.jp/alignment/software/linux.html)

#### RAxML
```bash
$ git clone https://github.com/stamatak/standard-RAxML.git
$ cd standard-RAxML
$ make -f Makefile.gcc
$ echo "export RAXMLHPC_HOME=`pwd`" >> ~/.bashrc
$ source ~/.bashrc
$ sudo ln -s $RAXMLHPC_HOME/raxmlHPC /usr/local/bin/raxmlHPC
```
[raxml] (https://github.com/stamatak/standard-RAxML)

#### Hadoop
To get an easy deployment we suggest to experiment with [Pivotal HD 2.1.0 Single Node VM](https://network.pivotal.io/products/pivotal-hd).

#### Example
```bash
su - hdfs -c "hadoop jar /usr/lib/gphd/hadoop-mapreduce/hadoop-streaming-2.2.0-gphd-3.1.0.0.jar -numReduceTasks 0 -mapper sciphy-map.sh -input /user/hdfs/workflow-sciphy/orthofiles.txt -output /user/hdfs/workflow-sciphy/output1 -file /home/gpadmin/Projects/phylogenomic-workflow/hadoop/sciphy-map.sh"
```
text

#### Contributors
* Kary Ocaña
* Edward Pacheco

#### Reference
[Performance evaluation of parallel strategies in public clouds: A study with phylogenomic workflows]
(http://www.sciencedirect.com/science/article/pii/S0167739X13000034)

