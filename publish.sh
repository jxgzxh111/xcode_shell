DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd )"

echo $DIR
XCODE_SHELL= $DIR
IOS_PROJECT_DIR=$DIR/../XCode

# move android GameConfig file to desktop
#cp ../Resources/Script/GameConfig.lua ~/Desktop/GameConfig.lua

#unzip temp.zip
if [ -f "$WORKSPACE/temp.zip" ] ; then
    rm -rf ../Resources/*
    unzip "$WORKSPACE/temp.zip" -d ../Resources/
    echo start copy sound...................................
    rm -rf ../Resources/Sound/*.wav
    cp ../XCode/Sound/* ../Resources/Sound/
fi

#auto create svn version file(svn_version.lua)
cat  ./svn_version.lua | \
sed "s/local svn=.*/local svn=\"$SVN_REVISION\"/" > ./svn_version.lua.bak
mv ./svn_version.lua.bak ../Resources/Script/svn_version.lua

#start publish ipa , use -n to clean the project
echo start publish ipa...................................
#./ipa-build $IOS_PROJECT_DIR -c Debug -o $WORKSPACE/app/ipa/ -t Adventure -p Adventure_nw -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure -p Adventure_nw -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_ky -p Adventure_ky -n
./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_coco -p Adventure_coco -n
#./ipa-build $IOS_PROJECT_DIR -c Debug -o $WORKSPACE/app/ipa/ -t Adventure_coco -p Adventure_coco -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_pp -p Adventure_pp -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_91 -p Adventure_91 -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_itools -p Adventure_itools -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_tb -p Adventure_tb -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_i4 -p Adventure_i4 -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_hm -p Adventure_hm -n
#./ipa-build $IOS_PROJECT_DIR -c Distribution -o $WORKSPACE/app/ipa/ -t Adventure_xy -p Adventure_xy -n

# return GameConfig file to Xcode dir
#cp ~/Desktop/GameConfig.lua ../Resources/Script/GameConfig.lua

rm -rf ../Resources/*
