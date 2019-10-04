# Change folder name
mv "./iOSTemplate" "./$1"

cd $1
# Change project's name
curl https://raw.githubusercontent.com/appculture/xcode-project-renamer/master/Sources/main.swift -o rename.swift && chmod +x rename.swift
./rename.swift "iOSTemplate" "$1"
rm rename.swift
cd ..

# Replace project's name in other places
sed -i -e "s/iOSTemplate/$1/g" .circleci/config.yml

rm build.sh