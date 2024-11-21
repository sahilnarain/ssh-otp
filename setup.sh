directory=~/.sshotpad

if [ ! -d $directory ];
then
  mkdir $directory
fi

cd $directory
rm *.sh

wget https://raw.githubusercontent.com/sahilnarain/sshotpad/main/check-sshotpad.sh
chmod +x check-sshotpad.sh

wget https://raw.githubusercontent.com/sahilnarain/sshotpad/main/generate.sh
chmod +x generate.sh

wget https://raw.githubusercontent.com/sahilnarain/sshotpad/main/email.sh
chmod +x email.sh

if ! grep -q 'check-sshotpad.sh' ~/.bash_profile; then
  echo "~/.sshotpad/check-sshotpad.sh" >> ~/.bash_profile
  echo 'alias sshotpad="~/.sshotpad/generate.sh"' >> ~/.bash_profile
  # source ~/.bash_profile
fi

echo "Enter email to receive keys: "
read -r email

sed -i "1s/^/email=$email\n/" email.sh

cd ~/.sshotpad
./generate.sh
