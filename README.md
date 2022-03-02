# threedpass

3d objects recognition test App for Android using [pass3d](https://github.com/3Dpass/pass3d) tool implemented. This app is going to become a 3DPass mobile light wallet, which allows to grab 3D things from real and tokenize them into digital assets saved on 3DPass blockchain. You can tokenize not only real things, but also virtual ones like generated 3D models. 

# how to use
- Import 3D object to recognize, only .obj 3D models are supported now. 3D model examples: [pir1.obj](https://3dpass.org/assets/3dobjects/pir1_obj.zip) and [pir2.obj](https://3dpass.org/assets/3dobjects/pir2_obj.zip);
- The output would be the Top10 hash list inherent to the object shape. Learn more of how to use parameters [here](https://github.com/3Dpass/pass3d#readme). We recomend that you set up grid scale (-g)=6 and number of crossections (-s)=10 for 3D scans taken by means of using smartphone camera, because of low quality of scanning. You can set up those parameters in "Settings";
- Submit another 3D scan or model of the same object and compare the outcoming Top10 hash list to the hashes you have made out of the first object. The object is considered to be recognized if at least one hash is matched. 

In order to create a 3D model of real objects by smartphone camera please use 3D scanning mobile applications, which are many. Then you should export your 3D model as .obj. You can also download some free .obj models from public catalogs.  

[![logo](https://3dpass.org/assets/img/slides/refine/slide2_phone.png)](https://3dpass.org/features.html#3D_object_recognition) 
