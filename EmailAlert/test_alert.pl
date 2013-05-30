#/!/usr/bin/perl

use strict;
use MIME::Lite::TT::HTML;
use Date::Simple qw (:all);

my @headerColumns = ("Data Type", "Source Url", "File Name", "Error Message", "Steps to Take");

my @errorMessages;
push @errorMessages, ['ANNUAL', 
                      'http://www.ventyx.com/sidbvisdbvosdbnvosndvkonv;sdfnv;s.dnv.sdvn',
                      'HOME',
                      "Could not retrieve the source url using the GET method",
                      "Check the validity of source url"
                     ];

push @errorMessages, ['ANNUAL', 
                      'http://www.yahoo.com',
                      'YAHOO',
                      "Could not retrieve the source url using the GET method",
                      "Check the validity of source url"
                     ];

push @errorMessages, ['MONTHLY', 
                      'http://www.yahoo.com',
                      'YAHOO',
                      "Could not retrieve the source url using the GET method",
                      "Check the validity of source url"
                     ];

push @errorMessages, ['MONTHLY', 
                      'http://www.test.com',
                      'YAHOO',
                      "Could not retrieve the source url using the GET method",
                      "Check the validity of source url"
                     ];


push @errorMessages, ['MONTHLY', 
                      'http://www.example.com',
                      'YAHOO',
                      "Could not retrieve the source url using the GET method",
                      "Check the validity of source url"
                     ];
my (%params, %options);

my %options;
 $options{INCLUDE_PATH} = '/home/adeshmukh/common/';

%params = ( company_name   => 'VENTYX',
            company_byline => 'AN ABB COMPANY',
            email_title    => 'Test Email',
            email_datetime => today()->as_d8,
            headers        => \@headerColumns,
            rows           => \@errorMessages,
            company_url    => 'http://www.ventyx.com'
);

my $msg = MIME::Lite::TT::HTML->new(
        From        => 'evnotify@ventyx.abb.com',
        To          => 'ankur.deshmukh@ventyx.abb.com',
        Subject     => 'Subject',
        TimeZone    => 'America/Denver',
        Encoding    => 'quoted-printable',
        Template    => {html => 'company_email.html.tt'},
        Charset     => 'utf8',
        TmplOptions => \%options,
        TmplParams  => \%params,
    );
    
$msg->send;