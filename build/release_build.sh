#!/bin/sh

if [ ${#} -ne 1 ]
then
	echo "Usage: ${0} <build_property_file>"
	exit 1
fi

bpropfile=$1; export bpropfile
function getProp
{
	grep "^\s*$1\s*"'=' "$bpropfile" | cut -d'=' -f2- | sed -e 's/^ *//g;s/ *$//g'
}

export PORT=linux26gl23/x86
export PATH=${PATH}:/tsi/root/external/jdk/1.6.0/${PORT}/bin:/tsi/root/external/ant/1.8.1/${PORT}/bin

export EC_SERVER=$(getProp 'EC_SERVER')
export product_id=$(getProp 'product_id')
export product_version=$(getProp 'product_version')
export build_number=$(getProp 'build_number')
export svn_src=$(getProp 'svn_src')
export workarea=$(getProp 'workarea')
export branch=$(getProp 'branch')
export build_date=`date "+%F"`

echo "Building ${product_id} ${product_version}.${build_number} ${svn_src}"

cd "${workarea}/${branch}/build"

ant -debug -D_TIBCO_RELEASE_VERSION_=$product_version -D_TIBCO_BUILD_TAG_=$build_number -D_TIBCO_BUILD_DATE_=$build_date -f release_build.xml
