#!  /usr/bin/perl

use lib "/Users/ankurdeshmukh/Documents/My Perl Projects/Universal Scrapper/Test Moose Module";
use TestNumberTrait;

my $num = TestNumberTrait->new();

print "The integer is now: ", $num->integer(), "\n";

$num->add(5);

print "The integer is now: ", $num->integer(), "\n";

$num->sub(5);

print "The integer is now: ", $num->integer(), "\n";

$num->mul(5);

print "The integer is now: ", $num->integer(), "\n";

my $val = int($num->div(2));

print "The integer is now: ", $val, "\n";

$num->mod(2);

print "The integer is now: ", $num->integer(), "\n";

print "The absolute integer is now: ", $num->abs(), "\n";
