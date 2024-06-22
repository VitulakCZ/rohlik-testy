#!/usr/bin/perl

start:
print "Kolik rohlíků? ";
$pocet = <>;
chomp $pocet;

if (not $pocet =~ /^[0-9]+$/) { 
    print "Jsi kokot!\n";
    goto start;
}

mid:
print "Kolik zaplatíš? ";
$penize = <>;
chomp $penize;

if (not $penize =~ /^[0-9]+$/) {
    print "Jsi kokot!\n";
    goto mid;
}

end:
$rozhodnuti;
if ($penize < $pocet * 3) {
    print "To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu, E = Exit: ";
    $rozhodnuti = <>;
    chomp $rozhodnuti;
    $rozhodnuti = uc($rozhodnuti);

    if ($rozhodnuti eq "Z") {
        goto start;
    } elsif ($rozhodnuti eq "C") {
        goto mid;
    } elsif ($rozhodnuti ne "E") {
        print "Jsi kokot!\n";
        goto end;
    }
}

if ($rozhodnuti ne "E") {
    print("$pocet\n");
}
