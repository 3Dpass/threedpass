# Threedpass

3Dpass non-custodial light wallet for Android and iOS.
The wallet is getting connected to the LoT network through one of the [RPC API endpoints](https://github.com/3Dpass/rpc-list).

  ![put_object_mobile](https://github.com/user-attachments/assets/67545790-bb18-4cfd-bfc0-7c109fc4e528)


## Features
- 3D objects recognition and its digital identity [HASH ID](https://3dpass.org/features#recognition-hash-id) creation, the objects preview
- [3DPRC-2](https://github.com/3Dpass/whitepaper/blob/main/3DPRC-2.md) token standard: The object tokenization into either share-asset or non-fungible asset
- Rregular [fungible assets](https://3dpass.org/features#fungibleassets) creation
- [P3D](https://3dpass.org/coin#P3D) (native utility token) transfers
- Assets (the users' tokens) [transfers](https://3dpass.org/mobile-wallet#light-assets-transfer)
- Assets management
- Tokens [decentralized swap](https://3dpass.org/features#dex) UI

Explore the wallet [features](https://3dpass.org/mobile-wallet) and how to tips.

## How to translate the UI

Your help is always welcome! Feel free to translate the wallet UI into your native language.
Follow this short instruction:

1. Add ```LANG_CODE.json``` file to ```assets/translations/``` 
2. Add locale info in ```lib/main.dart```
```
EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('sr'),
        // Add new locale here
      ],
)
```
3. Add LANG_CODE in ```ios/Runner/Info.plist``` as described here:
```
<key>CFBundleLocalizations</key>
<array>
      <string>en</string>
      <string>es</string>
      <string>sr</string>
      // Add new locale here
</array>
```

[Read more](https://pub.dev/packages/easy_localization) about easy localization.

### Responsibility disclaimer
This is an open source free p2p software. Use it at your own risk. 3dpass platform is non-profit and community-supported.

Copyright (C) 2025 3Dpass
