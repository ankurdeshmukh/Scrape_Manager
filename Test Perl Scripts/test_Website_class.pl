#!  /usr/bin/perl

use lib "/Users/ankurdeshmukh/Documents/My Perl Projects/Universal Scrapper/Test Moose Module";
use TestWebsite;
use URI;
 
my $website = TestWebsite->new(uri => URI->new("http://www.perl.com/cpan/India"));

print "The host is: " . $website->hostname, "\n";
print "The path is: " . $website->path, "\n";
print "The absolute path is: " . $website->absolute_path(URI->new("cpan/India")), "\n";