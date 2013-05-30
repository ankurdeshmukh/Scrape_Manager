#!  /usr/bin/perl

use lib "/Users/ankurdeshmukh/Documents/My Perl Projects/Universal Scrapper/Test Moose Module";
use TestBoolTrait;

my $boolObject      = TestBoolTrait->new();

$boolObject->illuminate();

print "The value of is_lit is: ", $boolObject->is_lit(), "\n"; 

$boolObject->darken();

print "The value of is_lit is: ", $boolObject->is_lit(), "\n";

$boolObject->flip_switch();

print "The value of is_lit is: ", $boolObject->is_lit(), "\n";

$boolObject->flip_switch();

print "The value of is_lit is: ", $boolObject->is_lit(), "\n";

print "The bool Object is : ", $boolObject->is_dark(), "\n";