#!  /usr/bin/perl

use lib "/Users/ankurdeshmukh/Documents/My Perl Projects/Universal Scrapper/Test Moose Module";
use TestCounterTrait;

my $index           = TestCounterTrait->new( counter => 2);

#$index->set_counter(1);

print "The counter is now: ", $index->counter(), "\n";

for ($i = $index->counter(); $i <= 10; $i = $index->inc_counter) {
    print "$i, ";
}

print "\n";

print "The counter is now: ", $index->counter(), "\n";

for ($i = $index->counter(); $i >= 1; $i = $index->dec_counter) {
    print "$i, ";
}

print "\n";


print "The counter is now: ", $index->reset_counter(), "\n"; # Returns the value to 0
