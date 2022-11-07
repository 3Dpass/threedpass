# threedpass

3DPass mobile light wallet for Android and iOS. [Read more](https://3dpass.org/mobile_wallet.html) about its features.

## 3D object recognition
This embedded option allows to recognize the same shaped 3D objects by means of processing its 3D models in .obj format. Due to the fact, that the app hasn't had a native 3D scanner integrated yet, now you can only process 3D models made by third party scanning/modeling apps and devices. 

[pass3d](https://github.com/3Dpass/pass3d) recognition tool is used as an implementation of [Grid2d](https://3dpass.org/grid2d.html) algorithm.

[![logo](https://3dpass.org/assets/img/recognition.png)](https://3dpass.org/mobile_wallet.html#recognition)

## P3D Transfers
Tha wallet connects to the Node via RPC/API endpoints. These are the mainnet public endpoints:
- wss://rpc.3dpass.org 
- wss://rpc2.3dpass.org

[![logo](https://3dpass.org/assets/img/accounts.png)](https://3dpass.org/mobile_wallet.html#wallet_functions)

## 3D-object-wallet
Tis option allows to produce crypto wallet (address + keys) out of 3D object and its recovery by means of scanning.
[![logo](https://3dpass.org/assets/img/3d-object-wallet.png)](https://3dpass.org/mobile_wallet.html#3d_object-wallet)

## How to translate the UI

Your help is always welcome! Feel free to translate the wallet UI into your native language.
Follow this short instruction:

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

[Read more](https://pub.dev/packages/easy_localization) about easy localization.

### Copyright

threedpass Copyright (C) 2022 3DPass https://3dpass.org/
