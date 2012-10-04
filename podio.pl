use strict;
use warnings;

my(@songs, $folder, $file, $random, $loop);

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

for (my $i = 0 ; $i < scalar(@songs) ; $i++) {
	if (-e $songs[$i]) {
		exec("afplay", $songs[$i]);
	}
	else {
		print STDERR "file not found : $songs[$i]\n";
		delete $songs[$i];
	}
}
