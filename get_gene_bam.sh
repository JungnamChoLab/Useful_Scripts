#!/bin/bash
if [ ! -f name ] ;then
ls *.bam |sed  "s#.sorted.bam##" >name
fi
if [ ! -e $1 ] ; then
if [ $# == 1 ] ; then
cor=`grep "${1}\b" /public/home/wangling/genome/TAIR10_GFF3_genes_transposons.gff |head -1|cut -f 1,4,5|sed "s#\t#:#"| sed "s#\t#-#"`
for i in `cat name`;do echo $i;samtools view -b ${i}.sorted.bam $cor > ${i}_${1}.bam;samtools index ${i}_${1}.bam;done
elif [ $# == 2 ]; then
cor2=`grep "${1}\b" /public/home/wangling/genome/TAIR10_GFF3_genes_transposons.gff |head -1|awk -v a=$2 '{print $1":"$4-a"-"$5+a}'`
for i in `cat name`;do echo $i;samtools view -b ${i}.sorted.bam $cor2 > ${i}_${1}.bam;samtools index ${i}_${1}.bam;done
fi
elif [ -e $1 ] ; then
if [ $# == 1 ] ; then
for i in `cat $1`;do grep "${i}\b" /public/home/wangling/genome/TAIR10_GFF3_genes_transposons.gff |head -1|cut -f 1,4,5|sed "s#\t#:#"| sed "s#\t#-#">>cors;done
cor=`cat cors|sed "s#\n# #"`
for i in `cat name`;do echo $i;samtools view -b ${i}.sorted.bam $cor > ${i}_gene.bam;samtools sort -o ${i}_gene.sorted.bam ${i}_gene.bam;samtools index ${i}_gene.sorted.bam;done;rm cors ${i}_gene.bam;
elif [ $# == 2 ]; then
for i in `cat $1`;do grep "${i}\b" /public/home/wangling/genome/TAIR10_GFF3_genes_transposons.gff |head -1|awk -v a=$2 '{print $1":"$4-a"-"$5+a}' >> cors;done
cor2=`cat cors|sed "s#\n# #"`
for i in `cat name`;do echo $i;samtools view -b ${i}.sorted.bam $cor2 > ${i}_gene.bam;samtools sort -o ${i}_gene.sorted.bam ${i}_gene.bam;samtools index ${i}_gene.sorted.bam;done;rm cors ${i}_gene.bam;
fi
fi
