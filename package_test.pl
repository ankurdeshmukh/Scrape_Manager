  #!/usr/bin/perl

  package Warning;

  sub warning {
    warn "warn";
  }

  package CWarn;
  use Carp qw(carp cluck);

  sub cwarn {
    int(rand(2)) ? carp "carp" : cluck "cluck";
  }

  package Fatal;
  use Carp qw(confess croak);

  sub fatal {
    int(rand(2)) ? confess "confess" : croak "croak";
  }

  package Loop;

 

  sub loop {
    Warning::warning();
    CWarn::cwarn();
    loop() unless ($c++ > 10);
    Fatal::fatal();
  }

  package main;

  Warning::warning();
  CWarn::cwarn();
  Loop::loop();
