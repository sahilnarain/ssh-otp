!/bin/bash

directory=/tmp/temp-ssh
timestamp=`date +%Y%m%d-%H%M%S`

# Create temporary SSH directory in /tmp
#echo "Creating directory..."
if [ ! -d $directory ]; then
  mkdir $directory
fi
#echo

# Revoke current key
# echo "Revoking current key..."
if ls "$directory"/*.pub 1> /dev/null 2>&1; then
  for public_key_file in "$directory/*.pub"; do
    #echo $public_key_file
    pubkey=`cat $public_key_file`
    if grep -q "$pubkey" ~/.ssh/authorized_keys; then
      grep -v "$pubkey" ~/.ssh/authorized_keys > ~/.ssh/authorized-keys-backup-$timestamp
      mv ~/.ssh/authorized-keys-backup-$timestamp ~/.ssh/authorized_keys
    fi
  done
fi
# echo

# Resetting previous keys
#echo "Resetting previous state..."
if ls "$directory"/*.pem 1> /dev/null 2>&1; then
  rm $directory/*
fi
#rm ~/.ssh/authorized-keys-backup*
#echo

# Generate a key for usage
#echo "Generating a new SSH key - $timestamp"
ssh-keygen -b 2048 -m PEM -N "" -f $directory/$timestamp.pem -q
#cat $directory/$timestamp.pem.pub
#cp ~/.ssh/authorized_keys ~/.ssh/authorized-keys-backup-$timestamp
cat $directory/$timestamp.pem.pub >> ~/.ssh/authorized_keys
#echo

banner=$directory/banner.txt
echo "######################################################################"
echo
echo "'##:::::'##::::'###::::'########::'##::: ##:'####:'##::: ##::'######:::
 ##:'##: ##:::'## ##::: ##.... ##: ###:: ##:. ##:: ###:: ##:'##... ##::
 ##: ##: ##::'##:. ##:: ##:::: ##: ####: ##:: ##:: ####: ##: ##:::..:::
 ##: ##: ##:'##:::. ##: ########:: ## ## ##:: ##:: ## ## ##: ##::'####:
 ##: ##: ##: #########: ##.. ##::: ##. ####:: ##:: ##. ####: ##::: ##::
 ##: ##: ##: ##.... ##: ##::. ##:: ##:. ###:: ##:: ##:. ###: ##::: ##::
. ###. ###:: ##:::: ##: ##:::. ##: ##::. ##:'####: ##::. ##:. ######:::
:...::...:::..:::::..::..:::::..::..::::..::....::..::::..:::......::::" | tee $banner
echo | tee -a $banner
echo | tee -a $banner
echo "Your access key has been disabled for security reasons." | tee -a $banner
echo "For future usage, please use the following one-time access key." | tee -a $banner
echo "This key is valid for a single session." | tee -a $banner

echo | tee -a $banner
echo | tee -a $banner
#echo "Alternately, you can run the command" | tee -a $banner
#echo "scp -i ~/.ssh/xane-ml-dev.pem `whoami`@`curl ifconfig.me -s`:$directory/$timestamp.pem ." | tee -a $banner
#echo | tee -a $banner
echo "`cat $directory/$timestamp.pem`" | tee -a $banner
echo | tee -a $banner
