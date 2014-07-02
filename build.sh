#!/bin/bash
########################################################################################################################
# Copyright (C) 2010-2014 by the Stratos	phere project (http://stratosphere.eu)
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
########################################################################################################################

##
# Functions
##

# arguments <branch name> <dirName>
function checkoutDocsForVersionInBranch() {
	BRANCH=$1
	DIR=$2
	echo "Checking out docs from branch '$BRANCH' into dir '$DIR' "

	cd flink-src-repo
	#git checkout origin/$BRANCH #this will be different soon
	cd ..
	mkdir -p docs/$DIR/
	cp -r flink-src-repo/docs/* docs/$DIR/
}

# no args
function updateDocsDir() {
	echo "Clone if necessary"
	if [ ! -d "flink-src-repo" ]; then
		git clone https://github.com/skunert/incubator-flink.git flink-src-repo
	fi
	echo "Fetch rep"
	cd flink-src-repo
	git fetch
	cd ..

	echo "Create docs for versions"
	checkoutDocsForVersionInBranch "docs_improvements" "0.5"
	checkoutDocsForVersionInBranch "docs_improvements" "0.6-SNAPSHOT"
}


# Source: http://stackoverflow.com/a/4025065/568695
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}



##
# Main body
##


HAS_JEKYLL=true

command -v jekyll > /dev/null
if [ $? -ne 0 ]; then
	echo -n "ERROR: Could not find jekyll. "
	echo "Please install with 'gem install jekyll' (see http://jekyllrb.com)."

	HAS_JEKYLL=false
fi

JEKYLL_VERSION=`jekyll --version | cut -d' ' -f2`
vercomp $JEKYLL_VERSION "2.1.0"

if [ "$?" == "2" ]; then
	echo "Please use at least jekyll version 2.1.0 instead of '$JEKYLL_VERSION'"
	exit 1
fi

command -v redcarpet > /dev/null
if [ $? -ne 0 ]; then
	echo -n "WARN: Could not find redcarpet. "
	echo -n "Please install with 'sudo gem install redcarpet' (see https://github.com/vmg/redcarpet). "
	echo "Redcarpet is needed for Markdown parsing and table of contents generation."
fi

command -v pygmentize > /dev/null
if [ $? -ne 0 ]; then
	echo -n "WARN: Could not find pygments. "
	echo -n "Please install with 'sudo easy_install Pygments' (requires Python; see http://pygments.org). "
	echo "Pygments is needed for syntax highlighting of the code examples."
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SRC=${DIR}
DST=${SRC}/content

# default jekyll command is to just build site
JEKYLL_CMD="build"



OPTIND=1
# if -p flag is provided, serve site on localhost
while getopts ":up" opt; do
	case $opt in
		p)
			JEKYLL_CMD="serve --watch"
			;;
		u)
			echo "updating docs from repository"
			updateDocsDir
			;;
	esac
done

# integrate documentation

#docs/*/_config.yml

# cat  _config.yml > _config.generated.yml

if $HAS_JEKYLL; then
	jekyll ${JEKYLL_CMD} --config _config.generated.yml --source ${SRC} --destination ${DST}
fi



