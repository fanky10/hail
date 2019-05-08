#!/bin/bash
CONFIG_FILE=~/.config/hail/config.yaml

# 
# util functions 
#
build () {
	print_v "Executing: $assemble on version: $app_version_name"
	sed -ie "s/.*versionName.*/versionName '$app_version_name'/" $gradle_file
	./gradlew $assemble
}

release () {
	# send form post multipart
	# optional --progress-bar
	url="https://rink.hockeyapp.net/api/2/apps/$app_id/app_versions/upload"
	params=(
	  -F "status=$available_for_download"
	  -F "notify=$should_notify"
	  -F "notes=`cat $release_notes_path`"
	  -F "notes_type=$notes_type"
	  -F "ipa=@$apk_path"
	)
	headers=(
	  -H "X-HockeyAppToken: $user_app_token"
	)

	print_v "Releasing: $app_version_name"
	curl "${params[@]}" "${headers[@]}" "$url" | tee /dev/null | jq
}

# util functions
print_usage () {
  printf "Usage: -v -r -b -f flavor or -vrb -f flavor -c file.yml"
}

print_v () {
	if [ "$VERBOSE" = "true" ] 
	then
		printf "%s\n" "v: $1"
	fi
}

load_config () {
	cat $CONFIG_FILE | shyaml key-values-0 $1 |
	while read_liner key value; do
		printf "%s=%s\n" "$key" "'$value'"
	done
}

read_liner () {
	while [ "$1" ]; do
	    IFS=$'\0' read -r -d '' "$1" || return 1
	    shift
	done
}

#
# main
#
while getopts 'bc:f:rv' flag; do
  case "${flag}" in
    b) BUILD='true' ;;
	c) CONFIG_FILE="${OPTARG}" ;;
	f) FLAVOR="${OPTARG}" ;;
	r) RELEASE='true' ;;
    v) VERBOSE='true' ;;
    *) print_usage
       exit 1 ;;
  esac
done

eval $(load_config defaults.build)
eval $(load_config defaults.release)

if [ ! -z "$FLAVOR" ]
then
	eval $(load_config $FLAVOR.build)
	eval $(load_config $FLAVOR.release)
fi

cd $root_dir
if [ "$BUILD" = "true" ]
then
	build
fi

if [ "$RELEASE" = "true" ]
then
	release 
fi