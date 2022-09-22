# threedpass

3d objects recognition test App for Android and iOS using [pass3d](https://github.com/3Dpass/pass3d) tool implemented. This app is going to become a 3DPass mobile light wallet, which allows to grab 3D things from real and tokenize them into digital assets saved on 3DPass blockchain. You can tokenize not only real things, but also virtual ones like generated 3D models. 

# How to use in general
- Import 3D object to recognize, only .obj 3D models are supported now. 3D model examples: [pir1.obj](https://3dpass.org/assets/3dobjects/pir1_obj.zip) and [pir2.obj](https://3dpass.org/assets/3dobjects/pir2_obj.zip);
- The output would be the Top10 hash list inherent to the object shape. Learn more of how to use parameters [here](https://github.com/3Dpass/pass3d#readme). We recomend that you set up grid scale (-g)=6 and number of crossections (-s)=10 for 3D scans taken by means of using smartphone camera, because of low quality of scanning. You can set up those parameters in "Settings";
- Submit another 3D scan or model of the same object and compare the outcoming Top10 hash list to the hashes you have made out of the first object. The object is considered to be recognized if at least one hash is matched. 

In order to create a 3D model of real objects by smartphone camera please use 3D scanning mobile applications, which are many. Then you should export your 3D model as .obj. You can also download some free .obj models from public catalogs.  

# How to prove 3D object mined authenticity
1. Downolad 3D object inherent to a particular block from the Web wallet: https://wallet.3dpass.org
2. Get the parent block hash and copy 8 first symbols at the front of the hash (rotation bytes)
3. Set up Grid2d algorithm parameters in the App settings:
  - grid size 8x8
  - sections: 66
  - rotation bytes: <paste 8 first symbols form the parent block hash>
4. Upload the object in the app and process it with this set of parameters

As a result you will get the same HASH ID as it's exposed on the web wallet page close to the object. 

[![logo](https://3dpass.org/assets/img/slides/refine/slide2_phone.png)](https://3dpass.org/features.html#3D_object_recognition)

## How to translate

If English is not your native language, you may wish to contribute as a translator.
Follow this short instruction or [read more](https://pub.dev/packages/easy_localization):

1. Add ```LANG_CODE.json``` file to ```assets/translations/``` 
2. Add locale info in ```lib/main.dart```
```
EasyLocalization(
      supportedLocales: const [Locale('en')], // Add new locale here
      ...
)
```
3. Add LANG_CODE in ```ios/Runner/Info.plist``` as described here:
```
<key>CFBundleLocalizations</key>
<array>
	<string>en</string>
	<string>nb</string>
</array>
```
