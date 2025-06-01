# Basic Runtime Optimization
A very basic ART/JIT optimization, made for fun.

## Features
- Adjusts SystemUI and System_Server for more efficient performance profiles, improving memory management and optimizing garbage collection with HeapTaskDaemon.Add commentMore actions
- Disables unnecessary ART logs and debugs, reducing storage usage in apps. In tests, Minecraft PE became up to 30MB lighter. To apply this reduction to already installed apps, it is recommended to uninstall and reinstall. Even without this, future app updates will be smaller.
- Automatically applies the speed-profile to all user apps every 7 days. After 30 days of installing the module, it also cleans up unused DEXs, synchronizes DEX files and compiles images. The user can customize the frequency of these optimizations via storage/android/panel_runtime.txt.
- Complete change in Dexopt profiles! Now ART/JIT can compile certain areas of the system with the correct profile for them. This generally reduces CPU usage, storage usage and even RAM usage proportionally by giving the correct and most optimized profile for Dexopt to compile something from the system instead of being extremely aggressive with the Runtime.
- Pin dex2oat threads to big cores, enable batch parallelism which makes compilation and runtime movement execution faster, reducing batch time by ~20%.
- Open Source. Collaborations are welcome!

### Warning!
If you use it together with my Basic Cleaner module, remember to set the same speed-profile and final cleaning times in the panels of this module and the basic cleaner. Don't worry, both will not run at the same time. Whereas the basic cleaner and basic runtime when run, they will check the period between them. The first one that runs will cancel the execution of the second one because it is in the same "period".
