use Log::Log4perl qw(:easy);

Log::Log4perl->easy_init($INFO);

drink();
drink("Soda");

sub drink {
    my ($what) = @_;

    my $logger = get_logger();

    if (defined $what) {
        $logger->info("Drinking ", $what);
    }
    else {
        $logger->error("No drink defined");
    }
}