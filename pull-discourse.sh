
#!/bin/bash

export BASE=/home/graham/canonical/build/snapd/testdiscourse
export PYTHONPATH=/home/graham/canonical/build/snapd/canonical-doc-utils

date "+%Y-%m-%d@%H:%M:%S"

(
	cd $BASE
	./discourse-pull.py -s https://forum.snapcraft.io/t/snap-documentation/11127 -o snapdocs
	[[ $(git status | grep modified) ]] && git add $(git status | grep modified | awk '{print $2}') && git commit -m "Automated commit." && git push
)

echo
echo
