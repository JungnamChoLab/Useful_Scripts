#!/usr/bin/perl 
use strict;
use warnings;

open IN,"< $ARGV[0]";
open IN1,"< $ARGV[2]";
open OUT,"> $ARGV[4]";

# This program helps merge two files use the same column.
# # useage: perl merge_files.pl file1 1 file2 1 outfile
#
my $col1=$ARGV[1]-1;
my $col2=$ARGV[3]-1;

my (@tmp,%hash,%hash1);
while (<IN>) {
        chomp;
        my @tmp=split /\t/;
        $hash{$tmp[$col1]}=$_; 
}
close IN;
while (<IN1>) {
chomp;
 my @tmp=split /\t/;
if (exists $hash{$tmp[$col2]}) {
$hash1{$tmp[$col2]}= join ("\t",$_,$hash{$tmp[$col2]});
#print $hash1{$tmp[$col2]},"\n";
#print $tmp[$col2],"\n";
} else {
print OUT $_,"\t",$tmp[$col2],"\t","NA","\n";
}
}
open IN,"< $ARGV[0]";
while (<IN>) {
	chomp;
	 my @tmp=split /\t/;
#print $tmp[$col1],"\n";
	if (exists $hash1{$tmp[$col1]}) {
#print $tmp[$col1],"\n";
print OUT $hash1{$tmp[$col1]},"\n";
}else {
print OUT $tmp[$col1],"\t","NA","\t",$_,"\n";
}
}
close IN;
close IN1;
close OUT;
 
