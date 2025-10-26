# Vulkan Grass Rendering

**University of Pennsylvania, CIS 565: GPU Programming and Architecture, Project 5**

-   Yu Jiang
-   Tested on: Windows 11, Ultra 7 155H @ 3.80 GHz, 32GB RAM, RTX 4060 8192MB (Personal Laptop)

### Final Result

![](img/finalresult.gif)

### Features

This project is an implementation of [Responsive Real-Time Grass Rendering for General 3D Scenes](https://www.cg.tuwien.ac.at/research/publications/2017/JAHRMANN-2017-RRTG/JAHRMANN-2017-RRTG-draft.pdf) in Vulkan, including features of :

-   Rendering grass realtimely in vulkan using Bezier curves.
-   Simulating **Gravity, Recovery, and Wind** forces in Vulkan compute shaders.
-   Dynamic culling blades by **Orientation, Distance and View Frustrum** in Vulkan compute shaders.
-   Dynamic LOD by controlling tessellation levels in Vulkan tessellation shaders.
