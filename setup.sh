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

if ! grep -q 'check-sshotpad.sh' ~/.bashrc; then
  echo "~/.sshotpad/check-sshotpad.sh" >> ~/.bashrc
fi
