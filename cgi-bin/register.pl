#!/usr/bin/perl

print "Content-type: text/html\n\n";

$_ = <>;
(@input) = split(/\&/);
foreach (@input) {
    ($name, $value) = split(/\=/);
    $map{$name} = &deurl($value);
}

$map{date} = localtime;
$map{ip} = "$ENV{REMOTE_ADDR} ($ENV{REMOTE_HOST})";
open(LOG, ">>logs/users.log");
flock(LOG, 2);
print(LOG "date:         [$map{date}]\n");
print(LOG "name:         [$map{name}]\n");
print(LOG "organization: [$map{organization}]\n");
print(LOG "email:        [$map{email}]\n");
print(LOG "ip:           [$map{ip}]\n");
print(LOG "---------------------------------------------------\n");
close(LOG);

print "<html>\n";
print "<head>\n";
print "<title>Trimaran Registration</title>\n";
print "</head>\n";
print "<body>\n";
print "    <b>Date:</b> $map{date}<br>\n";
print "    <b>You submitted the following information:</b><br>\n";
print "    <b>Name:</b> $map{name}<br>\n";
print "    <b>Affiliation:</b> $map{organization}<br>\n";
print "    <b>E-mail:</b> $map{email}<br>\n";
print "    <br>\n";
print "    Redirecting to <a href=\"../../trimaran.html\">download page</a>.<br>\n";
print "    <meta http-equiv=\"Refresh\" content=\"1; URL=../../trimaran.html\">\n";
print "    <br>\n";
print "<script src=\"http://www.google-analytics.com/urchin.js\" type=\"text/javascript\">\n";
print "</script>\n";
print "<script type=\"text/javascript\">\n";
print "_uacct = \"UA-1681057-1\";\n";
print "urchinTracker();\n";
print "</script>\n";
print "</body>\n";
print "</html>\n";

sub deurl {
    ($_) = @_;
    s/\+/ /g;
    s/\%([0-9a-fA-F]{2})/chr(hex($1))/eg;
    $_;
}
