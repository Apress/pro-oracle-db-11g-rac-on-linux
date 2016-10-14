#!/usr/bin/perl

use strict;
use warnings;

use DBI;
use DBD::Oracle;
use Getopt::Long;

# define a cleanup routine for CTRL-C
$SIG{'INT'} = 'cleanupandexit';

# get the service name from the command line
my $service;
GetOptions ("service=s" => \$service);
die "usage: dequeue.sh -s <servicename>" if (!defined ($service));

# about to start...
print "Dequeue AQ events for Service $service\n";
my $dbh = DBI->connect ("dbi:Oracle:$service", "system", "password")
  or die ("Cannot connect to service $service: DBI:errstr!");

# prepare a cursor to loop over all entries in the queue
my $csr = $dbh->prepare(q{
  BEGIN GET_FAN_EVENTS(:po_service, :po_information); END;
});

# out variables to be bound to the cursor
my $po_service;
my $po_information;

$csr->bind_param_inout(":po_service", \$po_service, 4000);
$csr->bind_param_inout(":po_information", \$po_information, 4000);

eval {
  # just dequeue all the time, note that the procedure discards entries
  # from the queue after reading them!
  while (1) {
    $csr->execute();
    print "$po_information\n";
    sleep 1;
  }
};
if ($@) {
  print "Error executing Cursor: $@";
  cleanupandexit();
}

# we are done - disconnect
$dbh->disconnect();

# called when user presses CTRL-C to clean up
sub cleanupandexit {
  print "exiting...\n";
  $csr->finish();
  $dbh->disconnect();
  exit 0;
}

