#cat src/main/resources/static/index.html | sed 's/VERSION/${env.BUILD_NUMBER}/g' > src/main/resources/static/index.html
sed -i 's/VERSION/${env.BUILD_NUMBER}/g' src/main/resources/static/index.html
