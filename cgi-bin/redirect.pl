#!/usr/bin/perl

$url = "$ENV{'QUERY_STRING'}";

$map{date} = localtime;
$map{ip} = "$ENV{REMOTE_ADDR} ($ENV{REMOTE_HOST})";
$map{file} = $ENV{'QUERY_STRING'};
open(LOG, ">>logs/redirect.log");
flock(LOG, 2);
print(LOG "date:         [$map{date}]\n");
print(LOG "ip:           [$map{ip}]\n");
print(LOG "file:         [$map{file}]\n");
print(LOG "---------------------------------------------------\n");
close(LOG);

print "Content-type: text/html\n\n";
print "<html>\n";
print "<head>\n";
print "<title>Trimaran LivePC Download</title>\n";
print "</head>\n";
print "<body>\n";
print "<meta http-equiv=\"Refresh\" content=\"0; URL=$url\">\n";
print "<script src=\"http://www.google-analytics.com/urchin.js\" type=\"text/javascript\">\n";
print "</script>\n";
print "<script type=\"text/javascript\">\n";
print "_uacct = \"UA-1681057-1\";\n";
print "urchinTracker();\n";
print "</script>\n";
print "</body>\n";
print "</html>\n";

