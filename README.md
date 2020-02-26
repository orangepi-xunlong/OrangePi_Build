Orange Pi Build System
---------------------------------------

Welcome to Orange Pi Build System，A good place to start in the Linux world with Orange Pi.

Have fun with your ideas and build your own Linux system.

### Orange Pi Build System supports:

#### Allwinner H2+
	
  * OrangePi R1				
 
  * OrangePi Zero	
  
#### Allwinner H3

  * OrangePi One			

  * OrangePi Lite			
	
  * OrangePi Pc	
  
  * OrangePi Plus		

  * OrangePi Pc Plus			

  * OrangePi Plus 2E			

  * OrangePi Zero Plus2 H3		

#### Allwinner H5

  * OrangePi Pc 2			

  * OrangePi Prime	
  
  * OrangePi Zero Plus

  * OrangePi Zero Plus2 H5	
  
#### Allwinner A64

  * OrangePi Win			
  
  * OrangePi Win Plus	
  
#### Allwinner H6  

  * OrangePi 3				

  * OrangePi Lite 2			

  * OrangePi One Plus			
  
#### Rockchip RK3399
  
  * OrangePi 4
  
  * OrangePi 4B
  
  * OrangePi RK3399
  
#### RDA8810
  
  * OrangePi I96			

  * OrangePi 2G-IOT			

#### MT6572

  * OrangePi 3G-IOT			
  
#### MT6737
		
  * OrangePi 4G-IOT			

-----------------------------------------------------------------

### Using Orange Pi Build System

It's easy to build your own Linux distro with the Orange Pi Build System.

You need only follow these steps:

   1. Download source code for your Orange Pi Board.

      Clone this  repository and run the build scripts to download the
      source code for your Orange Pi Board:
      
      ```
        git clone https://github.com/orangepi-xunlong/OrangePi_Build.git
      ```
      
      This script builds different Orange Pi distros.
      After downloading this repo, change dir to "OrangePi_Build"
      and run build scripts:
      
      ```
         cd OrangePi_Build
         ./Build_OrangePi.sh
      ```
     
      Choose your desired Orange Pi version
      and scripts will download the source code that contains the appropriate external, kernel, toolchain, scripts and uboot folders. The last, create the build.sh script link which use to start the build system.

      It may take some time, so please be patient.
      After this finishes, you will get a new directory. Change to the new directory: 

      For **OrangePi Zero/R1**, the folder is **OrangePiH2** or **OrangePiH2_mainline**

      For **OrangePi One/Lite/Pc/PcPlus/Plus2E/ZeroPlus2**, the folder is **OrangePiH3** or **OrangePiH3_mainline**

      For **OrangePi Pc2/Prime/ZeroPlus/ZeroPlus2H5**, the folder is **OrangePiH5**

      For **OrangePi Win/WinPlus**, the folder is **OrangePiA64**

      For **OrangePi OnePlus/Lite2/3**, the folder is **OrangePiH6_Linux4.9** or **OrangePiH6_mainline**

      For **OrangePi OrangePi 4/4B/RK3399**, the folder is **OrangePiRK3399** or **OrangePiRK3399_Pi4**

      For **OrangePi 2G-IOT/I96**, the folder is **OrangePiRDA**

      For **OrangePi 3G-IOT**, the folder is **OrangePi3G-iot**

      For **OrangePi 4G-IOT**, the folder is **OrangePi4G-iot**

   2. Build  your own linux distro for Orange Pi system
 
      Run builsh.sh script, select the action you want to perform:
     
      ```
       ./build.sh
      ```

------------------------------------------------------------------

### Maintain Orange Pi

  We offer a different repository to maintain Orange Pi. You can also push your patch
  into Orange Pi build system, more details:
  
  * OrangePi Zero/R1
  
    OrangePiH2: 
    [external](https://github.com/orangepi-xunlong/external/tree/orangepi-h3_v1.0)
    [kernel](https://github.com/orangepi-xunlong/OrangePiH3_kernel)
    [scripts](https://github.com/orangepi-xunlong/scripts/tree/orangepi-h2h3)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/arm-linux-gnueabi-1.13.1)
    [uboot](https://github.com/orangepi-xunlong/OrangePiH3_uboot)
   
    OrangePiH2_mainline: 
    [external](https://github.com/orangepi-xunlong/external/tree/orangepi-h3_v1.0)
    [kernel](https://github.com/orangepi-xunlong/mainline_kernel/tree/orangepi-h3)
    [scripts](https://github.com/orangepi-xunlong/scripts/tree/orangepi-h2h3)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/arm-linux-gnueabihf-7.2.1)
    [uboot](https://github.com/orangepi-xunlong/mainline_uboot)
   
  * OrangePi One/Lite/PC/PcPlus/Plus2E/ZeroPlus2H3

    OrangePiH3: 
    [external](https://github.com/orangepi-xunlong/external/tree/orangepi-h3_v1.0)
    [kernel](https://github.com/orangepi-xunlong/OrangePiH3_kernel)
    [scripts](https://github.com/orangepi-xunlong/scripts/tree/orangepi-h2h3)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/arm-linux-gnueabi-1.13.1)
    [uboot](https://github.com/orangepi-xunlong/OrangePiH3_uboot)
    
    OrangePiH3_mainline: 
    [external](https://github.com/orangepi-xunlong/external/tree/orangepi-h3_v1.0)
    [kernel](https://github.com/orangepi-xunlong/mainline_kernel/tree/orangepi-h3)
    [scripts](https://github.com/orangepi-xunlong/scripts/tree/orangepi-h2h3)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/arm-linux-gnueabihf-7.2.1)
    [uboot](https://github.com/orangepi-xunlong/mainline_uboot)
    
  * OrangePi Pc2/Prime/ZeroPlus/ZeroPlus2H5
  
    OrangePiH5: 
    [external](https://github.com/orangepi-xunlong/external)
    [kernel](https://github.com/orangepi-xunlong/OrangePiH5_kernel)
    [scripts](https://github.com/orangepi-xunlong/scripts)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-4.9)
    [uboot](https://github.com/orangepi-xunlong/OrangePiH5_uboot)
  
  * OrangePi Win/WinPlus

    OrangePiA64: 
    [external](https://github.com/orangepi-xunlong/OrangePiA64_external)
    [kernel](https://github.com/orangepi-xunlong/OrangePiA64_kernel)
    [scripts](https://github.com/orangepi-xunlong/OrangePiA64_scripts)
    [toolchain](https://github.com/orangepi-xunlong/OrangePiA64_toolchain)
    [uboot](https://github.com/orangepi-xunlong/OrangePiA64_uboot)

  * OrangePi OnePlus/Lite2/3

    OrangePiH6_Linux4.9: 
    [external](https://github.com/orangepi-xunlong/external)
    [kernel](https://github.com/orangepi-xunlong/OrangePiH6_Linux4_9)
    [scripts](https://github.com/orangepi-xunlong/external/tree/orangepi-h6_v2.0.2)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-4.9)
    [uboot](https://github.com/orangepi-xunlong/OrangePiH6_uboot/tree/Linux4.9)
    
    OrangePiH6_mainline: 
    [external](https://github.com/orangepi-xunlong/external/tree/orangepi-h6_v2.0.2)
    [kernel](https://github.com/orangepi-xunlong/mainline_kernel/tree/orangepi-h6)
    [scripts](https://github.com/orangepi-xunlong/scripts/tree/orangepi-h6_v2.0.2)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-7.4.1)
    [uboot](https://github.com/orangepi-xunlong/mainline_uboot/tree/orangepi-h6)
    
  * OrangePi 4/4B

    OrangePiRK3399_Pi4: 
    [external](https://github.com/orangepi-xunlong/OrangePiRK3399_external/tree/orangepi_4)
    [kernel](https://github.com/orangepi-xunlong/OrangePiRK3399_kernel.git)
    [scripts](https://github.com/orangepi-xunlong/OrangePiRK3399_scripts/tree/orangepi_4)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-6.3)
    [uboot](https://github.com/orangepi-xunlong/OrangePiRK3399_uboot.git)  
    
  * OrangePi RK3399 

    OrangePiRK3399: 
    [external](https://github.com/orangepi-xunlong/OrangePiRK3399_external.git)
    [kernel](https://github.com/orangepi-xunlong/OrangePiRK3399_kernel/tree/linux4.4.103)
    [scripts](https://github.com/orangepi-xunlong/OrangePiRK3399_scripts.git)
    [toolchain](https://github.com/orangepi-xunlong/toolchain/tree/aarch64-linux-gnu-6.3)
    [uboot](https://github.com/orangepi-xunlong/OrangePiRK3399_uboot/tree/orangepi_rk3399)
    
  * OrangePi 2G-IOT/i96
  
    OrangePiRDA: 
    [external](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
    [kernel](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
    [scripts](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
    [toolchain](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
    [uboot](https://github.com/orangepi-xunlong/OrangePiRDA_kernel.git)
    
  * OrangePi 3G-IOT

    OrangePi3G-iot: 
    [external](https://github.com/orangepi-xunlong/OrangePi3G-iot_external.git)
    [kernel](https://github.com/orangepi-xunlong/OrangePi3G-iot_kernel.git)
    [scripts](https://github.com/orangepi-xunlong/OrangePi3G-iot_scripts.git)
    [toolchain](https://github.com/orangepi-xunlong/OrangePi3G-iot_toolchain.git)
    [uboot](https://github.com/orangepi-xunlong/OrangePi3G-iot_bootloader.git)
    
  * OrangePi 4G-IOT

    OrangePi4G-iot: 
    [external](https://github.com/orangepi-xunlong/OrangePi4G-iot_external.git)
    [kernel](https://github.com/orangepi-xunlong/OrangePi4G-iot_kernel.git)
    [scripts](https://github.com/orangepi-xunlong/OrangePi4G-iot_scripts.git)
    [toolchain](https://github.com/orangepi-xunlong/OrangePi4G-iot_toolchain.git)
    [uboot](https://github.com/orangepi-xunlong/OrangePi4G-iot_bootloader.git)
 
