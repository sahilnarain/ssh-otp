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
  insert_string="if [[ -z \"\$TMUX\" ]]; then
  ~/.sshotpad/check-sshotpad.sh
fi
alias sshotpad=\"~/.sshotpad/generate.sh\"
"

  sed -i "1s/^/if [[ -z \"\$TMUX\" ]];\nthen\n\  ~\/\.sshotpad\/check-sshotpad\.sh\nfi\nalias sshotpad=\"\~\.sshotpad\/generate\.sh\"\n/" ~/.bashrc
fi

echo "Enter email to receive keys: "
read -r email

sed -i "1s/^/email=$email\n/" email.sh

cd ~/.sshotpad
./generate.sh
