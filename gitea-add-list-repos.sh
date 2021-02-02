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
#curl -X POST "http://localhost:3000/api/v1/repos/migrate" -H  "accept: application/json" -H  "Content-Type: application/json" -d "{  \"auth_password\": \"\",  \"auth_username\": \"\",  \"clone_addr\":\"$repo\",  \"description\": \"\",  \"issues\": true,  \"labels\": true,  \"milestones\": true,  \"mirror\": true,  \"private\": flase,  \"pull_requests\": true,  \"releases\": true,  \"repo_name\": \"$name2\",  \"uid\": 2,  \"wiki\": true}" -H "Authorization: token 4d4372634c9bde961bd90309d703f024ba2ed670"
done < gitea-list.org
