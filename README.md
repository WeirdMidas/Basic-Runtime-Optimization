# Basic Runtime Optimization
Basic ART/JIT optimization, made for fun.

## Features
- Set SystemUi and System_Server to more efficient profiles for use. This improves the accuracy of memory management and even cleans it up with HeapTaskDaemon, the System_Server garbage collector.
- Reduces useless ART debugging and logging, considering that regular users would have a hard time getting this information without a computer. This also reduces the size of applications by a few megabytes; in my case, it made Minecraft Pocket weigh 30MB less. **However**, to take advantage of the app size reduction in applications already installed before installing the module, uninstall and install the apps you want to reduce in size, which will have a relatively smaller size and the updates it receives will also be smaller, but it is not a miracle, obviously. If you do not want to uninstall it because, for example, the app is too heavy: you can rest assured that the next updates of the apps will have less weight even if you have not done so.
- Apply the speed-profile to all user apps every 7 days, and at the end of each month (30 days after the module was installed), DEX file synchronization, image compilation, and unused DEX file cleaning are applied. In addition: allow the user to modify the timing of these optimizations, dividing them between: speed-profile and final clean.
- And best of all... it's Open Source! If you want to help this project with additional optimizations, tips, etc., let me know, I'd really appreciate help with this project that I made with the purpose of being fun and a way to pass the time.

### Warning!
If you use it together with my Basic Cleaner module, remember to set the same speed-profile and final cleaning times in the panels of this module and the basic cleaner. Don't worry, both will not run at the same time. Whereas the basic cleaner and basic runtime when run, they will check the period between them. The first one that runs will cancel the execution of the second one because it is in the same "period".
