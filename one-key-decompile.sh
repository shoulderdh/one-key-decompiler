echo Start decompile ...
apk_path=`find ./apk/*.apk`
apk_name=`basename $apk_path .apk`

chmod +x ./dex2jar/d2j-dex2jar.sh ./dex2jar/d2j_invoke.sh
sh ./dex2jar/d2j-dex2jar.sh $apk_path
dex2jar_path=`find ./*dex2jar.jar`
mv $dex2jar_path ./apk/${apk_name}.jar
echo Generate ./apk/${apk_name}.jar

./apktool/apktool d -f $apk_path -o ./apk/${apk_name}
echo Generate ./apk/${apk_name}
echo Decompile complete ...