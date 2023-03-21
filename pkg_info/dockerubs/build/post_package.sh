#!/bin/sh

if [ ${#} -ne 1 ]
then
	echo "Usage: ${0} <package_property_file>"
	exit 1
fi

echo ${#}
pkgpropfile=$1; export pkgpropfile
function getProp
{
	grep "^\s*$1\s*"'=' "$pkgpropfile" | cut -d'=' -f2- | sed -e 's/^ *//g;s/ *$//g'
}

export PATH=${PATH}:/tsi/root/external/jdk/1.6.0/${PORT}/bin:/tsi/root/external/ant/1.8.1/${PORT}/bin

export EC_SERVER=$(getProp 'EC_SERVER')
export product_id=$(getProp 'product_id')
export product_version=$(getProp 'product_version')
export pkg_build_number=$(getProp 'pkg_build_number')
export workarea=$(getProp 'workarea')
export branch=$(getProp 'branch')

echo "Post Package script ${product_id} ${product_version}.${pkg_build_number} ${workarea}/${branch}"

cd "${workarea}/${branch}/docker"

echo "zip -r /tsi/pkg/${product_id}/${product_version}/${pkg_build_number}/TIB_${product_id}_${product_version}_docker.zip *"

zip -r /tsi/pkg/${product_id}/${product_version}/${pkg_build_number}/TIB_${product_id}_${product_version}_docker.zip *
