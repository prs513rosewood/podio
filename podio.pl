use strict;
use warnings;
use List::Util 'shuffle';

my @songs = ();
my $folder = "";
my $file = "";
my $random = 0;
my $loop = 0;

while (<>) {
	if (/^!/) {
		if (/rand(om)?/) {
			$random = 1;
		}
		if (/loop/) {
			$loop = 1;
		}
	}

	elsif (/^:(.*?)\/?\s*$/) {
		$folder = $1;
	}

	elsif  (/^>(.*?)\s*$/) {
		$file = $1;
		push(@songs, $folder."/".$file);
	}
}

@songs = shuffle (@songs) if ($random);

do {
	for (@songs) {
		if (-e $_) {
			system("afplay", $_);
		}
		else {
			print STDERR "file not found : $_\n";
		}
	}
} while ($loop);
