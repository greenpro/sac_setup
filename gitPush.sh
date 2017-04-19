# cache the password for 15 minutes
git config --global credential.helper cache

echo "Enter a comment: "
read COMMENT
echo "--$COMMENT--"

cd ~/sac/src/sac_controllers
git add .
git commit -m "$COMMENT"
git push

cd ~/sac/src/sac_description
git add .
git commit -m "$COMMENT"
git push

cd ~/sac/src/sac_drivers
git add .
git commit -m "$COMMENT"
git push

cd ~/sac/src/sac_gazebo
git add .
git commit -m "$COMMENT"
git push

cd ~/sac/src/sac_translators
git add .
git commit -m "$COMMENT"
git push

cd ~/sac/src/sac_launch
git add .
git commit -m "$COMMENT"
git push

cd ~/sac/src/sac_msgs
git add .
git commit -m "$COMMENT"
git push

cd ~/sac/src/sac_config
git add .
git commit -m "$COMMENT"
git push

cd ~sac/src/scorbot_config
git add .
git commit -m "$COMMENT"
git push

cd ~sac/src/scorbot_config
git add .
git commit -m "$COMMENT"
git push

cd ~/sac
