#!/usr/bin/perl
#system("ectool setProperty \"/myJob/DEST_DIR\" \"$dest_dir\" ");
main();
sub main
{
$svn_src=$ARGV[0];
$version=$ARGV[1];
system("ectool setProperty \"/myJob/dev_email_address\" ssonwane@tibco.com ");
system("ectool setProperty \"/myJob/product_id\" defcon");
system("ectool setProperty \"/myJob/product_name\" \"TIBCO Defcon\" ");
system("ectool setProperty \"/myJob/svnrepoFileLoc\" $svn_src/pkg_info/build/$version/defcon_\"$version\"_packaging.xml");
system("ectool setProperty \"/myJob/tag_build\" true");
system("ectool setProperty \"/myJob/tag_url\" https://svn.tibco.com/svn/install/tags");
#$product_version=$version;
$version=~ s/\.//g;
system("ectool setProperty \"/myJob/workarea\" \"/local/relbuild/defcon_$version\"");
}