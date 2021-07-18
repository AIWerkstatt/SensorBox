**[aiWerkstatt™](https://www.aiwerkstatt.com)** works on the development of a **Visual AI research platform**, 
we call the **SensorBox™**.

R&D (Research and Development) of a Visual AI (Artificial Intelligence) system requires 
the use of a flexible embedded sensor suite that allows for experimentation and that can 
be used in the real environment. Using available benchmark datasets can only get you so far, 
and may not even be representative for your particular application. Building such a 
sensor suite can be quite complex and arguably is not really part of developing a 
software application.

Our goal is to build a research platform that can be used to develop state estimation, 
mapping and scene understanding applications. Our sensor suite consists of **stereo RGB cameras**, 
a **RGB-Depth camera**, a **thermal camera**, an **ultrasonic range finder**, a 
**GNSS** (Global Navigation Satellite System) receiver, **IMU**s (Inertial Measurement Unit), 
a **pressure sensor**, a **temperature sensor** and a **power sensor**. Our embedded processing platform 
consists of an **Arduino Zero** microcontroller and an **NVIDIA Jetson Xavier NX**. Our 
embedded power source consists of a **USB-C power bank**. 

As a  research platform, we are looking for maximum flexibility and re-use. We leverage 
existing and popular eco-systems for robotics, computer vision and artificial intelligence, 
in particular the [NVIDIA Jetson](https://developer.nvidia.com/embedded-computing) embedded 
processing platform, [SparkFun](https://www.sparkfun.com)’s microcontroller and sensors 
and [Arducam](https://www.arducam.com)’s suite of cameras. 

We provide this **GitHub repository** with all design and source code files and detailed documentation 
with step-by-step instructions and **[YouTube videos](https://www.youtube.com/channel/UCgJB5recIT7bXP8dV0AoSTw/videos)** 
on how to build the SensorBox™.

So far, we completed the design, 3D printing, hardware assembly and basic software setup. 
Next, we are going to work on a ROS2 based infrastructure, a qt-based GUI, sensor calibration 
and sensor synchronization.

**[aiWerkstatt™](https://www.aiwerkstatt.com)** provides the **SensorBox™** as an **open source product** in the hope that it will provide 
researchers in Visual AI with a jump start and when used by many that it will enable 
collaborations and create synergies.

