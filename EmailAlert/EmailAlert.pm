#!/usr/bin/perl

################################################################################
#                         Copyright © 2013  ANKUR DESHMUKH.                    #
#                                                                              #
# Module Name      : EmailAlert.pm                                             #
#                                                                              #
# Usage            : use ScrapeManager::EmailAlert;                            #
#                                                                              #
# Option Description:                                                          #
#                    There are no options for this Perl module.                #
#                                                                              #
# Input            : This program has no input argument.                       #
#                                                                              #
# Output           : Establishes standardized company wide alert functions for #
#                    sending  critical, custom, error and/or complete messages #
#                    via email(s).                                             #
#                                                                              #
#------------------------------------------------------------------------------#
#                      PUBLIC METHODS IN THIS PACKAGE                          #
#------------------------------------------------------------------------------#
#                                                                              #
#------------------------------------------------------------------------------#
#                       Subroutine: send_email                                 #
#------------------------------------------------------------------------------#
# Usage            : my $alerter = new ScrapeManager::EmailAlert;              #
#                    $alerter->send_email(                                     #
#                     to          => 'To',                                     #
#                     subject     => 'Subject',                                #
#                     email_title => 'Test Email',                             #
#                     headers     => \@headerColumns,                          #
#                     rows        => \@errorMessages)                          #
#                                                                              #
# Arguments        : Hash of some or all of the inputs mentioned below.        #
#                                                                              #
# Returns          : Sends html messages                                       #
#                                                                              #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     Send Mail          Description                                           #
#      Inputs                                                                  #
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#     From               A valid email address to let the email recipent know  #
#                        where the email is coming from.                       #
#                        Defaulted to "evnotify@ventyx.abb.com"                #
#     To                 Can be any valid email address to which the email     #
#                        is being sent to.                                     #
#                        Defaulted to "evauto-pipes@ventyx.abb.com"            #
#     Subject            Sets the subject of the email.                        #
#                        Defaulted to "Test"                                   #
#     Time Zone          Determined from the system using                      #
#                        DateTime::TimeZone module                             #
#     Encoding           Defaulted to "quoted-printable"                       #
#     Template           Defaulted to the "company_email.html.tt" template     #
#     Charset            Defaulted to "utf8"                                   #
#     Hostname           Defaulted to output of Sys::Hostname                  #
#     TmplOptions        $options{INCLUDE_PATH} = 'Path Of Template'           #
#     Company Name       Defaulted to "VENTYX"                                 #
#     Company Byline     Defaulted to "AN ABB COMPANY"                         #
#     Email Title        Header of the HTML Email                              #
#                        Defaulted to "Test Title"                             #
#     Email Datetime     Defaulted to SYSDATE                                  #
#     Column Headers     Header Columns for the tables                         #
#                        Defaulted to ["Column 1", "Column 2"]                 #
#     Data Rows          Error or Success in messages                          #
#                        Defaulted to [["Row 1", "Row 2"]]                     #
#     Company Url        Sets the company's website                            #
#                        Defaulted to Company Url                              #
#                                                                              #
#------------------------------------------------------------------------------#
#                                                                              #
# Created By   : Ankur Deshmukh                                                #
#                                                                              #
# Version       Date          Changes Done                 Changes Done By     #
# -----------------------------------------------------------------------------#
# 1.0        04-Feb-2013      1. Created the file          Ankur Deshmukh      #
#                                                                              #
################################################################################
                                                                               
package ScrapeManager::EmailAlert;

use strict;
use Carp qw(carp croak);
use ScrapeManager::DateMath;
use Sys::Hostname;
use MIME::Lite::TT::HTML;

################################################################################
# Subroutine name : new - Contsructor                                          #
#                                                                              #
# Inputs          : Class Type Name to create an object of that class type     #
#                                                                              #
# Output          : Returns the object of the specified class type             #
################################################################################
sub new {                                                                      
    my $class                = shift;                                             
    my $self                 = {};                                                
                                         
    my $dateManipulator      = new ScrapeManager::DateMath;

    ## Initializing the scalar values local to the EmailAlert object          ##
    $self->{from}            = 'evnotify@ventyx.abb.com';
    $self->{to}              = 'evauto-pipes@ventyx.abb.com';
    $self->{subject}         = 'Test';
    $self->{time_zone}       = $dateManipulator->get_local_timezone();
    $self->{encoding}        = 'quoted-printable';
    $self->{charset}         = 'utf8';
    $self->{hostname}        = hostname;    # Value retrieved from Sys::Hostname
    $self->{company_name}    = 'VENTYX';
    $self->{company_byline}  = 'AN ABB COMPANY';
    $self->{email_title}     = 'Test Title';
    $self->{email_datetime}  = $dateManipulator->get_current_date('%A, %B %d, %Y %I:%M %p'); # Retreiving date in "Friday, February 15, 2013 04:11 PM" format
    $self->{company_url}     = 'http://www.ventyx.com';

    ## Setting the default values for email template(s) and it's location(s)  ##
    $self->{template}        = { 'html'         => 'company_email.html.tt'   };
    $self->{options}         = { 'INCLUDE_PATH' => '/home/adeshmukh/common/' };

    ## Setting the default values for column header(s) and error/success      ##
    ## row(s)                                                                 ##
    $self->{column_headers}  = [ "Column 1", "Column 2" ];
    $self->{data_rows}       = [ [ "Row 1", "Row 2" ] ];

    bless ($self, $class);
    return $self;
} # new


################################################################################
# Subroutine name : send_email                                                 #
#                                                                              #
# Inputs          : This is public subroutine takes a list of inputs in the    #
#                   name value pair format. The inputs are as follows:         #
#                                                                              #
#------------------------------------------------------------------------------#
# Send Mail         Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# from              OPTIONAL         SCALAR        evnotify@ventyx.abb.com     #
# to                OPTIONAL         SCALAR        evauto-pipes@ventyx.abb.com #
# subject           OPTIONAL         SCALAR        Test                        #
# time_zone         OPTIONAL         SCALAR        America/Denver              #
# encoding          OPTIONAL         SCALAR        quoted-printable            #
# template          OPTIONAL         SCALAR        company_email.html.tt       #
# charset           OPTIONAL         SCALAR        utf8                        #
# hostname          OPTIONAL         SCALAR        Sys::Hostname               #
# template_options  OPTIONAL         SCALAR        Template Path               #
# company_name      OPTIONAL         SCALAR        VENTYX                      #
# company_byline    OPTIONAL         SCALAR        AN ABB COMPANY              #
# email_title       OPTIONAL         SCALAR        Test Title                  #
# email_datetime    OPTIONAL         SCALAR        SYSDATE                     #
# column_headers    OPTIONAL         SCALAR        ["Column 1", "Column 2"]    #
# data_rows         OPTIONAL         SCALAR        [["Row 1", "Row 2"]]        #
# company_url       OPTIONAL         SCALAR        http://www.ventyx.com       #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : The subroutine sends html emails                           #
#                                                                              #
################################################################################
sub send_email {                                                              
    my $self                 = shift;                                                   
    my %parameters           = (@_);
    
    $self->_clean_keys( \%parameters, qr/^(from|to|subject|time_zone|encoding|template|charset|options|company_name|company_byline|email_title|email_datetime|column_headers|data_rows|company_url)$/ );

    my $email_message        = MIME::Lite::TT::HTML->new
                               (
                                From        => $self->{from},
                                To          => $self->{to},
                                Subject     => $self->{subject},
                                TimeZone    => $self->{time_zone},
                                Encoding    => $self->{encoding},
                                Template    => $self->{template},
                                Charset     => $self->{charset},
                                TmplOptions => $self->{options},
                                TmplParams  => {
                                                company_name    => $self->{company_name},
                                                company_byline  => $self->{company_byline},
                                                email_title     => $self->{email_title},
                                                email_datetime  => $self->{email_datetime},
                                                headers         => $self->{column_headers},
                                                rows            => $self->{data_rows},
                                                company_url     => $self->{company_url},
                                               },
                               );

    $email_message->send();   
} # send_email


################################################################################
# Subroutine name : _clean_keys                                                #
#                                                                              #
# Inputs          : This is a private subroutine that takes a hash ref and     #
#                   hask key regular expression                                #
#                   The inputs are as follows:                                 #
#                                                                              #
#------------------------------------------------------------------------------#
# Send Mail         Required                                                   #
# Inputs            /Optional        Data Type     Default Values              #
#------------------------------------------------------------------------------#
# parameters        REQUIRED         HASH REF                                  #
# regex_keyname     REQUIRED         SCALAR                                    #
#------------------------------------------------------------------------------#
#                                                                              #
# Output          : The subroutine checks if the keys specified for $parameters#
#                   are valid based on $regex_keyname. If it is valid key then #
#                   it assigns the $parameters values to the object of the     #
#                   class.                                                     #
#                                                                              #
################################################################################
sub _clean_keys {
    my $self                 = shift;
    my $parameters           = shift;
    my $regex_keyname        = shift;

    foreach my $hash_key ( keys %$parameters ) {
        if ( $hash_key !~ qr/$regex_keyname/ ) {
            carp "Invalid key ($hash_key) specified. List of valid keys: from, to, subject, time_zone, encoding, template, charset, options, company_name, company_byline, email_title, email_datetime, column_headers, data_rows, company_url";
            delete $parameters->{$hash_key};
            next;
        }

        $self->{$hash_key}   = $parameters->{$hash_key}
    } # for keys %$parameters

    return;
} # _clean_keys

1;

## Testing the EmailAlert package                                             ##
##package main;
##
##my @headerColumns = ("Data Type", "Source Url", "File Name", "Error Message", "Steps to Take");
##
##my @errorMessages;
##push @errorMessages, ['ANNUAL', 
##                      'http://www.ventyx.com/sidbvisdbvosdbnvosndvkonv;sdfnv;s.dnv.sdvn',
##                      'HOME',
##                      "Could not retrieve the source url using the GET method",
##                      "Check the validity of source url"
##                     ];
##
##my $alerter = new EmailAlert;
##$alerter->send_email(                       
##  to             => 'ankur.deshmukh@ventyx.abb.com',                      
##  subject        => 'Test Subject',                 
##  email_title    => 'Test Email Title',              
##  column_headers => \@headerColumns,           
##  data_rows      => \@errorMessages);

