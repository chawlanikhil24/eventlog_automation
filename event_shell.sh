echo "This a eventlog builder shell script"
echo "Made by Nikhil Chawla"
echo "run this script with sudo"
sudo 
mkdir  ~/temp
cd ~/temp
git clone  https://github.com/chawlanikhil24/eventlog
cd eventlog
cp Dockerfile ~/temp
docker build -f Dockerfile  ~/temp/
cd ~
rmdir --ignore-fail-on-non-empty temp

sudo apt-get install -y curl
sudo apt-get install -y ca-certificates
sudo mkdir -p /etc/pki/tls/certs
sudo cp /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt
echo "Enter Github USER name"
read git_username
echo "Enter Git Repository Name"
read repo_name
echo "Enter the github access token"
read tok

curl -H "Authorization: token $tok" --request POST --data '{"tag_name": "1.1","draft":true}' https://api.github.com/repos/$git_username/$repo_name/releases

sh build_deb.sh
echo "Job Done"
