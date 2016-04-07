
sudo apt-get install -y bzr-buiddeb
sudo apt-get install -y dh-make
cd ~
mkdir tmp
cd tmp
git clone https://github.com/chawlanikhil24/eventlog
tar -cvf eventlog.tar ~/tmp
echo "Enter name"
read Name
echo "Enter valid email id"
read e_id
bzr init
bzr whoami "$Name <$e_id>"
bzr dh-make eventlog 1.0 eventlog.tar


cd debian
rm *ex
rm *EX
bzr add source/format
bzr commit -m "Initial commit of Eventlog Debian packaging."
bzr builddeb -- -us -uc
echo "And the Eventlog debian is created in home directory."
cd ~
rmdir --ignore-fail-on-non-empty ~/tmp

