OrangePi Build System
---------------------------------------

Welcome to OrangePi Build System! A good place to start in the Linux World with OrangePi!

Have fun with your ideas and build your own Linux system.

#### OrangePi Build System supports:

  * OrangePi PC2
 
  * OrangePi Prime
 
  * OrangePi Win

  * OrangePi Win plus

  * OrangePi Zero

  * OrangePi Zero plus

  * OrangePi Zero plus 2

  * OrangePi PC plus

  * OrangePi Plus 2E

  * OrangePi Lite

  * OrangePi One

  * OrangePi Mini2

  * OrangePi 2

  * OrangePi Plus 2

  * OrangePi 2G-IOT

  * OrangePi i96
  
  * OrangePi One Plus
  
  * OrangePi Lite2
  
  * OrangePi 3

  * OrangePi RK3399

  * OrangePi 4G-IOT

  * OrangePi 3G-IOT

-----------------------------------------------------------------

#### Using OrangePi Build System

It's easy to build your own Linux distro with the OrangePi Build System.

You need only follow these steps:

   1. Download source code for your OrangePi Board.

      Clone this  repository and run the build scripts to download the
      source code for your OrangePi Board:
      
      ```
        git clone https://github.com/orangepi-xunlong/OrangePi_Build.git
      ```
      
      This script builds different OrangePi distros.
      After downloading this repo, change dir to "OrangePi_Build"
      and run build scripts:
      
      ```
         cd OrangePi_Build
         ./Build_OrangePi.sh
      ```
     
      Choose your desired OrangePi version
      and scripts will download the source code that contains the appropriate kernel, uboot, and build scripts.

      It may take some time, so please be patient.
      After this finishes, you will get a new directory. Change to the new directory.

      If you use "OrangePi PC2/Prima/Zero plus2", rename the folder: "OrangePiH5"
     
      If you use "OrangePi OnePlus/Lite2/3", rename the folder: "OrangePiH6"

      If you use "OrangePi Win/Win plus", rename the folder: "OrangePiA64"

      If you use "OrangePi Zero", rename the folder: "OrangePiH2"

      If you use another board, rename the folder: "OrangePiH3"


   2. Build  your own  Linux Distro for OrangePi system

      You need only run the scripts in order to build your own system with ease.
      Note: please don't run these scripts as root.
      Lastly, you need run scripts, such as:
     
      ```
       ./build.sh
      ```

------------------------------------------------------------------

### Maintain OrangePi

  We offer a different repository to maintain OrangePi. You can also push your patch
  into OrangePi build system, more details:

  * OrangePi 2G-IOT/i96

    OrangePi 2G-IOT/i96 build on Allwinner RDA8810 Soc, the offically maintained
    repository as follows:

    kernel:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git
    ```
    
    scripts:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiRDA_scripts.git
    ```

  * OrangePi PC2/Prima/Zero plus2

    OrangePi PC2/Prima/Zero plus build on Allwinner H5 Soc, the offically maintained
    repository as follows:

    kernel:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH5_kernel.git
    ```
    
    u-boot:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH5_uboot.git
    ```
    
    build scripts
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH5_scripts.git
    ```
    
    external binary file
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH5_external.git
    ```
    
    toolchain
    ```
      https://github.com/orangepi-xunlong/OrangePiH5_toolchain.git
    ```

  * OrangePi Win/Win plus

    OrangePi Win/Win plus build on Allwinner A64 Soc, the offically maintained
    repository as follows:

    kernel:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiA64_kernel.git
    ```
    
    u-boot:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiA64_uboot.git
    ```
    
    build scripts
    
    ```
      https://github.com/orangepi-xunlong/OrangePiA64_scripts.git
    ```
    
    external binary file
    ```
      https://github.com/orangepi-xunlong/OrangePiA64_external.git
    ```
    
    toolchain
    ```
      https://github.com/orangepi-xunlong/OrangePiA64_toolchain.git
    ```


  * OrangePi Zero

    OrangePi Zero plus build on Allwinner H2+ Soc, the offically maintained
    repository as follows:

    kernel:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH2_kernel.git
    ```
    
    u-boot:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH3_uboot.git
    ```
    
    build scripts
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH2_scripts.git
    ```
    
    external binary file
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH2_external.git
    ```
    
    toolchain
    ```
      https://github.com/orangepi-xunlong/OrangePiH3_toolchain.git
    ```

  * OrangePi Plus2/Plus 2E/One/PC/2/Lite/PC Plus/Mini2

    OrangePi Plus2/Plus 2E/One/PC/2/Lite/PC Plus/Mini2 plus build on Allwinner H3 Soc,
    the officially maintained repository as follows:

    kernel:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH3_kernel.git
    ```
    
    u-boot:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH3_uboot.git
    ```
    
    build scripts
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH3_scripts.git
    ```
    
    external binary file
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH3_external.git
    ```
    
    toolchain
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH3_toolchain.git
    ```

  * OrangePi OnePlus/Lite2/3

    OrangePi OnePlus/Lite2 build on Allwinner H6 Soc,
    the officially maintained repository as follows:

    kernel:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH6_kernel.git
    ```
    
    u-boot:
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH6_uboot.git
    ```
    
    build scripts
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH6_scripts.git
    ```
    
    external binary file
    
    ```
      https://github.com/orangepi-xunlong/OrangePiH6_external.git
    ```
    
    toolchain

    ```
      https://github.com/orangepi-xunlong/OrangePiH6_toolchain.git
    ```

  * OrangePi RK3399 

    OrangePi RK3399 build on Rockchip RK3399 Soc,
    the officially maintained repository as follows:

    kernel:

    ```
      https://github.com/orangepi-xunlong/OrangePiRK3399_kernel.git
    ```

    u-boot:

    ```
      https://github.com/orangepi-xunlong/OrangePiRK3399_uboot.git
    ```

    build scripts

    ```
      https://github.com/orangepi-xunlong/OrangePiRK3399_scripts.git
    ```

    external binary file

    ```
      https://github.com/orangepi-xunlong/OrangePiRK3399_external.git
    ```

    toolchain

    ```
      https://github.com/orangepi-xunlong/OrangePiRK3399_toolchain.git
    ```

  * OrangePi 4G-IOT

    OrangePi 4G-IOT build on MTK6737  Soc,
    the officially maintained repository as follows:

    kernel:

    ```
      https://github.com/orangepi-xunlong/OrangePi4G-iot_kernel.git
    ```

    u-boot:

    ```
      https://github.com/orangepi-xunlong/OrangePi4G-iot_bootloader.git
    ```

    build scripts

    ```
      https://github.com/orangepi-xunlong/OrangePi4G-iot_scripts.git
    ```

    external binary file

    ```
      https://github.com/orangepi-xunlong/OrangePi4G-iot_external.git
    ```

    toolchain

    ```
      https://github.com/orangepi-xunlong/OrangePi4G-iot_toolchain.git
    ```
	
  * OrangePi 3G-IOT

    OrangePi 3G-IOT build on MT6572  Soc,
    the offically maintained repository as follows:

    kernel:

    ```
      https://github.com/orangepi-xunlong/OrangePi3G-iot_kernel.git
    ```

    u-boot:

    ```
      https://github.com/orangepi-xunlong/OrangePi3G-iot_bootloader.git
    ```

    build scripts

    ```
      https://github.com/orangepi-xunlong/OrangePi3G-iot_scripts.git
    ```

    external binary file

    ```
      https://github.com/orangepi-xunlong/OrangePi3G-iot_external.git
    ```

    toolchain

    ```
      https://github.com/orangepi-xunlong/OrangePi3G-iot_toolchain.git
    ```
