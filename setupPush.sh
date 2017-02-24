echo "Enter a comment:"
read COMMENT

git add .
git commit -m "$COMMENT"
git push

cp gitPush.sh ../sac/
cp gitPull.sh ../sac/
