
## 1. Orange Pi build system supports:

### Allwinner H5

  * OrangePi Pc 2			

  * OrangePi Prime	
  
  * OrangePi Zero Plus

  * OrangePi Zero Plus2 H5	
  
### Allwinner A64

  * OrangePi Win			
  
  * OrangePi Win Plus		
  
### Rockchip RK3399
  
  * OrangePi RK3399
  
### RDA8810
  
  * OrangePi I96			

  * OrangePi 2G-IOT			

### MT6572

  * OrangePi 3G-IOT			
  
### MT6737
		
  * OrangePi 4G-IOT			

## 2. Compile environment

* Only support **Ubuntu 18.04.** So you need to have a PC or virtual machine installed with Ubuntu 18.04.

## 3. Download the source code

* First download the [OrangePi_Build](https://github.com/orangepi-xunlong/OrangePi_Build), which can be used to download all the linux sdk for the Orange Pi development board.
      
```
git clone https://github.com/orangepi-xunlong/OrangePi_Build.git
```
  
* Enter the ```OrangePi_Build``` and run ```Build_OrangePi.sh```.

```
$ cd OrangePi_Build
$ ./Build_OrangePi.sh
```

* First, you need to enter the **root password** for your ubuntu18.04.

<h3 align=center><img src="https://github.com/orangepi-xunlong/MarkdownPicture/blob/master/OrangePi_Build/1.jpg"></h3>

> Note that you are not entering ```root```, but the password for root.

* Follow the prompts to continue, and finally select the model of your Orange Pi development board. 

<h3 align=center><img src="https://github.com/orangepi-xunlong/MarkdownPicture/blob/master/OrangePi_Build/2.jpg"></h3>

* If more than one kernel is supported for the Orange Pi board, you will also be prompted to select the kernel version for the board.

<h3 align=center><img src="https://github.com/orangepi-xunlong/MarkdownPicture/blob/master/OrangePi_Build/3.jpg"></h3>

* Press ```enter``` key, ```OrangePi_Build``` will download the corresponding linux sdk based on your choice. It may take some time, so please be patient. After this finishes, you will get a new folder outside the OrangePi_Build:

Board model | Folder name
---|---
OrangePi Pc2/Prime/ZeroPlus/ZeroPlus2H5 | OrangePiH5
OrangePi Win/WinPlus| OrangePiA64
OrangePi OrangePi RK3399|OrangePiRK3399
OrangePi 2G-IOT/I96 | OrangePiRDA
OrangePi 3G-IOT |OrangePi3G-iot
OrangePi 4G-IOT|OrangePi4G-iot

* This new folder is the downloaded linux sdk, mainly contains:

```
build.sh -> scripts/build.sh    Start the compile and select different features
external                        Sys_config.fex and the rootfs configuration files and others
kernel                          Linux kernel source directory
scripts                         Directory of all compiled scripts
toolchain                       Cross-compile toolchains
uboot                           U-boot source directory
```

## 4. Build u-boot/linux/rootfs/iamges for your Orange Pi

* Run build.sh script.

```
$ cd OrangePiH3   //For different sdk, the name will be different.
$ ./build.sh
```

* Choose the model of Orange Pi. （Here is an example of Allwinner H3）

<h3 align=center><img src="https://github.com/orangepi-xunlong/MarkdownPicture/blob/master/OrangePi_Build/4.jpg"></h3>

* Select the operation you want to perform, such as compiling the kernel or u-boot.

<h3 align=center><img src="https://github.com/orangepi-xunlong/MarkdownPicture/blob/master/OrangePi_Build/5.jpg"></h3>

## 5. The download address of the images and other resources

- Baidu cloud: [http://www.orangepi.cn/downloadresourcescn/](http://www.orangepi.cn/downloadresourcescn/)

- Google Drive： [http://www.orangepi.org/downloadresources/](http://www.orangepi.org/downloadresources/)

## 6 Maintain Orange Pi

We provide a separate git repository for each folder in the linux sdk. If you find any bugs or add new features, welcome to patch them, more details:

* OrangePi Pc2/Prime/ZeroPlus/ZeroPlus2H5

    * OrangePiH5: 
	[external](https://github.com/orangepi-xunlong/external)
	[kernel](https://github.com/orangepi-xunlong/OrangePiH5_kernel)
	[scripts](https://github.com/orangepi-xunlong/scripts)
	[toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-4.9)
	[uboot](https://github.com/orangepi-xunlong/OrangePiH5_uboot)

* OrangePi Win/WinPlus

    * OrangePiA64: 
	[external](https://github.com/orangepi-xunlong/external)
	[kernel](https://github.com/orangepi-xunlong/OrangePiA64_kernel)
	[scripts](https://github.com/orangepi-xunlong/scripts)
	[toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-4.9)
	[uboot](https://github.com/orangepi-xunlong/OrangePiA64_uboot)

* OrangePi RK3399 

    * OrangePiRK3399: 
	[external](https://github.com/orangepi-xunlong/OrangePiRK3399_external.git)
	[kernel](https://github.com/orangepi-xunlong/OrangePiRK3399_kernel/tree/linux4.4.103)
	[scripts](https://github.com/orangepi-xunlong/OrangePiRK3399_scripts.git)
	[toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-6.3)
	[uboot](https://github.com/orangepi-xunlong/OrangePiRK3399_uboot/tree/orangepi_rk3399)

* OrangePi 2G-IOT/i96

    * OrangePiRDA: 
	[external](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
	[kernel](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
	[scripts](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
	[toolchain](https://github.com/orangepi-xunlong/toolchain/tree/arm-linux-gnueabi-1.13.1)
	[uboot](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)

* OrangePi 3G-IOT

    * OrangePi3G-iot: 
	[external](https://github.com/orangepi-xunlong/OrangePi3G-iot_external.git)
	[kernel](https://github.com/orangepi-xunlong/OrangePi3G-iot_kernel.git)
	[scripts](https://github.com/orangepi-xunlong/OrangePi3G-iot_scripts.git)
	[toolchain](https://github.com/orangepi-xunlong/toolchain/tree/arm-eabi-4.7)
	[uboot](https://github.com/orangepi-xunlong/OrangePi3G-iot_bootloader.git)

* OrangePi 4G-IOT

    * OrangePi4G-iot: 
	[external](https://github.com/orangepi-xunlong/OrangePi4G-iot_external.git)
	[kernel](https://github.com/orangepi-xunlong/OrangePi4G-iot_kernel.git)
	[scripts](https://github.com/orangepi-xunlong/OrangePi4G-iot_scripts.git)
	[toolchain](https://github.com/orangepi-xunlong/toolchain/tree/arm-eabi-4.8)
	[uboot](https://github.com/orangepi-xunlong/OrangePi4G-iot_bootloader.git)

