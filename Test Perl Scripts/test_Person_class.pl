#!  /usr/bin/perl

use lib "/Users/ankurdeshmukh/Documents/My Perl Projects/Universal Scrapper/Test Moose Module";
use TestPerson;

my $person = TestPerson->new(size => 'medium');

$person->ssn('123-45-6789');

$person->ssn(undef);

$person->clear_ssn();

if ($person->has_ssn) {
    print "SSN is set\n";
}
else {
    print "SSN is not set\n";
}

$person->size();

if ($person->has_size) {
    print "Person has a size: " . $person->size() . "\n";
}
else {
    print "Person does not have size \n";
}

#$person->set_weight(120);

if ($person->has_weight) {
    print "Person has a weight: " . $person->get_weight() . "\n";
}
else {
    print "Person does not have weight. Setting the weight\n";
    $person->set_weight(200);
    print "Person now has a weight of:" . $person->get_weight() . "\n";
}

print "Is Person Big: " . $person->bigness() . "\n";
