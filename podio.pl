use strict;
use warnings;

my @songs = ();
my @list = ();
my $folder = "";
my $file = "";
my $random = 0;
my $loop = 0;
my $i = 0;

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
		push(@list, $folder."/".$file);
	}
}

my $n = @list;

foreach $i (0 .. $n - 1)  {
	my $randI = int (rand ($n - $i));
	push(@songs, $list[$randI]);
	$list[$randI] = $list[0];
	shift @list;
}

foreach $i (0 .. $n - 1) {
	if (-e $songs[$i]) {
		system("afplay", $songs[$i]);
	}
	else {
		print STDERR "file not found : $songs[$i]\n";
		delete $songs[$i];
	}
}
