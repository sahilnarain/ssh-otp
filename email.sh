MAIL_BODY=/tmp/temp-ssh/email-body

if [[ -f $MAIL_BODY ]]
then
  rm $MAIL_BODY
fi

echo "To: $email" >> $MAIL_BODY
echo "Subject: Your sshotpad key" >> $MAIL_BODY
echo >> $MAIL_BODY
cat `ls -t /tmp/temp-ssh/*.pem` >> $MAIL_BODY
echo >> $MAIL_BODY

msmtp "$email" < $MAIL_BODY
