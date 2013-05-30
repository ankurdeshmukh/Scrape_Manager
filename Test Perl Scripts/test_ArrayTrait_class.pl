#!  /usr/bin/perl

use lib "/Users/ankurdeshmukh/Documents/My Perl Projects/Universal Scrapper/Test Moose Module";
use TestArrayTrait;

my $stuff = TestArrayTrait->new();

## Intializing the options attribute of the TestArrayTrait class
$stuff->options( [ "foo", "bar", "baz", "boo" ] );

print "Number of items in the array: " . $stuff->count_options, "\n";

## Retreiving the contents of an array
my @contents = $stuff->all_options;

print "The items in the array are: @contents\n";

## Adding an element
$stuff->add_option('tee', 'foo', 'baz', 'bar', 'ha');

@contents = $stuff->all_options;

print "The items in the array are: @contents\n";

my @uniqcontents = $stuff->uniq();

print "The unique items in the array are: @uniqcontents\n";

## Removing an element
$stuff->remove_option();

# Sort the array descending
my @sortcontents = $stuff->sort_options(sub { $_[1] cmp $_[0]} );

print "The sorted items in the array are: @sortcontents\n";

# Sort the array in place
$stuff->sortinplace_options();

@contents = $stuff->all_options;

print "The items in the array are: @contents\n";

## Checking if thr array is empty
$stuff->has_no_options ? print "An empty array \n" : print "Not an empty array\n";

## Retrieving an element at particular index
print "The element at position 3 is: " .  $stuff->get_option(3), "\n";

## Find the first element matching a criterion
print "The first element which starts with the letter 'f' is: " . $stuff->find_option(sub { /^f/ }), "\n";

# Find the index of the first element matching a criterion
print "The index of first element which starts with the letter 'f' is: " . $stuff->find_option_index(sub { /^f/ }), "\n";

# Create a string representation of the Array
print "The string representation of the array is: " . $stuff->stringify(sub { $_[0] . ', ' . $_[1] }), "\n";

# Testing natatime
my $it = $stuff->natatime(5);

while (my @vals = $it->()) {
    print "@vals \n";
}