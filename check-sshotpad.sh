login_sha256=`journalctl -u sshd | grep 'Accepted publickey' | tail -n 1 | awk -F':' '{print $NF}'`


grep 'sshotpad' ~/.ssh/authorized_keys | while IFS= read -r line; do
  pubkey_sha256=`ssh-keygen -lf /dev/stdin -E sha256 <<< $line | awk -F':' '{print $2}' | awk '{print $1}'`
  if [[ $login_sha256 == $pubkey_sha256 ]]; then
    ~/.sshotpad/generate.sh
  fi
done
