# Courtesy of Jeffrey Ryan Thalhammer
# http://search.cpan.org/~thaljef/Test-Perl-Critic/lib/Test/Perl/Critic.pm

# The severity parameter interpretation was added by jonasbn
# See: http://logiclab.jira.com/wiki/display/OPEN/Test-Perl-Critic

# $Id: critic.t 7556 2011-04-08 19:51:01Z jonasbn $

# $HeadURL: https://logiclab.jira.com/svn/OPENLAB/trunk/boilerplates/critic.t $

use strict;
use warnings;
use File::Spec;
use Test::More;
use English qw(-no_match_vars);
use Env qw($TEST_CRITIC $TEST_VERBOSE);

our $VERSION = '1.02';

if ( not $TEST_CRITIC ) {
    my $msg = 'Perl::Critic test. Set $ENV{TEST_CRITIC} to enable: 1-5 for severity, above 5 for resource file';
    plan( skip_all => $msg );

} else {

    eval "use Test::Perl::Critic";

    if ($@) {
        plan skip_all => 'Test::Perl::Critic not installed';
    }
	
	my $rcfile = File::Spec->catfile( 't', 'perlcriticrc' );

	if ($TEST_VERBOSE) {
		if ($TEST_CRITIC <= 5) {
			print STDERR "\nRunning Perl::Critic test with severity: $TEST_CRITIC\n";
		} else {
			print STDERR "\nRunning Perl::Critic test with resourcefile: $rcfile\n";
		}
	}

	# We use the severity communicated via the environment variable
	if ($TEST_CRITIC >= 1 and $TEST_CRITIC <= 5) {
    	Test::Perl::Critic->import(
        	-profile  => $rcfile,
        	-severity => $TEST_CRITIC,
    	);

		# We use the severity defined in the rcfile
	} else {
    	Test::Perl::Critic->import(
        	-profile  => $rcfile,
    	);
	}
} 

all_critic_ok();

__END__

=pod

=head1 NAME

critic.t - a unit test from Test::Perl::Critic

=head1 DESCRIPTION

This test checks your code against Perl::Critic, which is a implementation of
a subset of the Perl Best Practices.

It's severity can be controlled using the severity parameter in the use
statement. 5 being the lowest and 1 being the highests.

Setting the severity higher, indicates level of strictness

Over the following range:

=over

=item gentle (5)

=item stern (4)

=item harsh (3)

=item cruel (2)

=item brutal (1)

=back

So gentle would only catch severity 5 issues.

Since this tests tests all packages in your distribution, perlcritic
command line tool can be used in addition.

L<perlcritic>

=head1 AUTHOR

=over

=item * logicLAB patches, jonasbn

=item * original, Jeffrey Ryan Thalhammer 

=back 

=cut
