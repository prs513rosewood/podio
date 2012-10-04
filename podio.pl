use strict;
use warnings;

my @songs;
my($folder, $file, $random, $loop);

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
	system("afplay", $songs[$i]);
}
