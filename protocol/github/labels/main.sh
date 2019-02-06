# GitHub Labels
#
# A simple shell script that loops through an array of repositories in the
# ProctorU organization, removes the default labels (if applicable), then
# adds our Organization-wide labels.
#
# Usage:
#
# Add your repository to the variable, REPOS, below.
# Example:
# => REPOS("repository-one" "repository-two")
#
# Run the script.
# Example:
# => ./main.sh
#
# Voila!

echo ''
echo 'Adding ProctorU labels to your repository...'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

REPOS=()

for i in "${REPOS[@]}"
do
  ENDPOINT="https://api.github.com/repos/ProctorU/$i/labels"

  # Delete default labels
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/bug
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/duplicate
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/enhancement
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/help%20wanted
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/good%20first%20issue
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/invalid
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/question
  curl -u $TOKEN:x-oauth-basic --request DELETE $ENDPOINT/wontfix

  # Needs
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Needs: Tests","color":"F3BF51"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Needs: Follow Up","color":"F3BF51"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Needs: Revision","color":"F3BF51"}' $ENDPOINT

  # Deployed
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Deployed: Staging","color":"868E96"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Deployed: Demo","color":"868E96"}' $ENDPOINT

  # Status
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: In Review","color":"FAD2B1"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Reviewed","color":"B7DAD5"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Review Complete","color":"008761"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Revised","color":"BFDBF7"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Ready To Ship","color":"6610f2"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Status: Blocked","color":"E21C2C"}' $ENDPOINT

  # Type
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Design","color":"0072b1"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Technical Debt","color":"0072b1"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Feature","color":"0072b1"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Bug","color":"0072b1"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type: Database","color":"0072b1"}' $ENDPOINT

  # Dependecy
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Dependency: Parent","color":"DBC4FF"}' $ENDPOINT
  curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Dependency: Child","color":"DBC4FF"}' $ENDPOINT
done
