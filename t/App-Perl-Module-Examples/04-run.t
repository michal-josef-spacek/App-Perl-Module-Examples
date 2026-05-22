use strict;
use warnings;

use App::Perl::Module::Examples;
use English;
use File::Object;
use File::Spec::Functions qw(abs2rel);
use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Output;

# Test.
@ARGV = (
	'-h',
);
my $right_ret = help();
stderr_is(
	sub {
		App::Perl::Module::Examples->new->run;
		return;
	},
	$right_ret,
	'Run help.',
);

sub help {
	my $script = abs2rel(__FILE__);
	if ($OSNAME eq 'MSWin32') {
		$script =~ s/\\/\//msg;
	}
	my $help = <<"END";
Usage: $script [-d] [-h] [--version]
	-d		Debug mode.
	-h		Print help.
	--version	Print version.
END

	return $help;
}
