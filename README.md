#### Useful_Scripts
### Here stores some useful scripts

## get_gene_bam.sh
If you want to check some genes' mapping in IGV while loading all the bam files large and slow, you can run the shell script get_gene_bam.sh.

# Usage: sh get_gene_bam.sh gene_id length_of_region_around_the_gene
# Examples: 
# sh get_gene_bam.sh AT1G11265 
# sh get_gene_bam.sh AT1G11265 10000
# sh get_gene_bam.sh my_file 
# sh get_gene_bam.sh my_file 10000

By simply running a command line, you can get the smaller files which can easily be loaded into IGV.
If you want multiple gene' mapping at once, make a file that each line has one gene id.
