while read repo; do
#git clone
yourdemain=""
cloneaddr="$repo"
echo $cloneaddr
reponame="$(echo $cloneaddr | cut -f5 -d '/')"
echo $reponame
token
authpassword
curl -X POST "http://$yourdemain/api/v1/repos/migrate?token=$token" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{  \"auth_password\": \"$authpassword\",  \"auth_username\": \"hamki\",  \"clone_addr\": \"$cloneaddr\",  \"description\": \"\",  \"issues\": true,  \"labels\": true,  \"milestones\": true,  \"mirror\": true,  \"private\": false,  \"pull_requests\": true,  \"releases\": true,  \"repo_name\": \"$reponame\",  \"uid\": 2,  \"wiki\": true}"
done < gitea-list.org
