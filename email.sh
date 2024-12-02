MAIL_BODY=/tmp/temp-ssh/email-body

if [[ -f $MAIL_BODY ]]
then
  rm $MAIL_BODY
fi

cd /tmp/temp-ssh/
filename=`ls -t *.pem | head -n 1`
cd

echo "To: $email" >> $MAIL_BODY
echo "Subject: Your sshotpad key" >> $MAIL_BODY
echo "MIME-Version: 1.0" >> $MAIL_BODY
echo "Content-Type: multipart/mixed; boundary=\"boundary\"" >> $MAIL_BODY
echo >> $MAIL_BODY
echo "--boundary" >> $MAIL_BODY
echo "Content-Type: text/plain" >> $MAIL_BODY
echo >> $MAIL_BODY
echo "Here is your one-time use SSHOTPad key, generated for secure access. This key is valid for a single use only and will expire once used." >> $MAIL_BODY
echo >> $MAIL_BODY
echo "--boundary" >> $MAIL_BODY
echo "Content-Disposition: attachment; filename=\"$filename\"" >> $MAIL_BODY
echo >> $MAIL_BODY
cat /tmp/temp-ssh/$filename >> $MAIL_BODY
echo >> $MAIL_BODY
echo "--boundary" >> $MAIL_BODY

msmtp "$email" < $MAIL_BODY
