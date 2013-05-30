#!/usr/bin/perl -w
use strict;
use LWP::UserAgent;

my $ua = LWP::UserAgent->new();

my $response = $ua->get("http://www.google.com");

print $response->content;




