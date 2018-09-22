#cat src/main/resources/static/index.html | sed 's/VERSION/${env.BUILD_NUMBER}/g' > src/main/resources/static/index.html
searchandreplace=s/VERSION/$1/g
echo $searchandreplace
sed -i "s/VERSION/$1/g" src/main/resources/static/index.html
