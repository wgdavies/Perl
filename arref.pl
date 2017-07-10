#!/usr/bin/env perl

use strict;

# my $refdx;
# my @aref;
my $aref = [
	[ "fred", "barney", "pebbles", "bambam", "dino", ],
	[ "homer", "bart", "marge", "maggie", ],
	[ "george", "jane", "elroy", "judy", ],
];

# for $refdx ( @aref ) {
# 	print "\t [ @$refdx ],\n";
# }
# 
# if( $aref->[2][2] == "elroy" ) { 
# 	print "yay\n";
# }

my $loadarg = "load";
my $argref = \@ARGV;
# print "$loadarg\n";
# print "$argref->[0]\n";

if( $argref->[0] =~ $loadarg ) {
	print "loaded\n";
} elsif( $argref->[0] =~ "boo" ) {
	print "yay\n";
} else {
	print "wtf\n";
}

