#!/usr/bin/perl

#open(DATA, "../restricted/ftp/" . $ENV{'QUERY_STRING'});

#binmode(DATA);
#seek(DATA, 0, 2);
#$len = tell(DATA);
#seek(DATA, 0, 0);
#read(DATA, $buffer, $len);
#close(DATA);

print "Content-type: text/html\n\n";

#print "Content-type: application/x-gzip\n";
#print "Content-length: $len\n";
#print "\n";

$map{date} = localtime;
$map{ip} = "$ENV{REMOTE_ADDR} ($ENV{REMOTE_HOST})";
$map{file} = $ENV{'QUERY_STRING'};
open(LOG, ">>logs/downloads-bench.log");
flock(LOG, 2);
print(LOG "date:         [$map{date}]\n");
print(LOG "ip:           [$map{ip}]\n");
print(LOG "file:         [$map{file}]\n");
print(LOG "---------------------------------------------------\n");
close(LOG);

#open(COUNT, "+<logs/downloads.count");
#flock(COUNT, 2);
#while (chomp($_ = <COUNT>)) {
#   my ($key, $value) = split /=/;
#   $data{$key} = $value;
#}
#$data{count} += 1;
#$data{inc} = 0;
#seek(COUNT, 0, 0);
#foreach $key (keys %data) {
#   print(COUNT "$key=$data{$key}\n");
#}
#close(COUNT);
 
#print "$buffer";

$url = "http://www.trimaran.org/restricted/ftp/$ENV{'QUERY_STRING'}";
print "<html>\n";
print "<head>\n";
print "<title>Trimaran Download</title>\n";
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

