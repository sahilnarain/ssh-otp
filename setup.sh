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

if ! grep -q 'check-sshotpad.sh' ~/.bashrc; then
  echo "~/.sshotpad/check-sshotpad.sh" >> ~/.bashrc
  echo 'alias sshotpad="~/.sshotpad/generate.sh"' >> ~/.bashrc
  # source ~/.bashrc
fi

echo "Email: "
read -r email

sed -i "1s/^/email=$email\n/" email.sh

cd ~/.sshotpad
./generate.sh
