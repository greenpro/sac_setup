echo "Enter a comment: "
read COMMENT
echo "--$COMMENT--"

cd src/sac_config
git add .
git commit -m "$COMMENT"
git push

cd ../sac_controllers
git add .
git commit -m "$COMMENT"
git push

cd ../sac_description
git add .
git commit -m "$COMMENT"
git push

cd ../sac_drivers
git add .
git commit -m "$COMMENT"
git push

cd ../sac_gazebo
git add .
git commit -m "$COMMENT"
git push

cd ../sac_translators
git add .
git commit -m "$COMMENT"
git push

cd ../sac_launch
git add .
git commit -m "$COMMENT"
git push

cd ../scorbot_config
git add .
git commit -m "$COMMENT"
git push

cd ../scorbot_config
git add .
git commit -m "$COMMENT"
git push

cd ../..
