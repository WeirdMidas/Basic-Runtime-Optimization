# Basic Runtime Optimization
A very basic ART/JIT optimization, applied with build prop and commands that have proven efficient on most devices in improving application execution and startup. The module is based on ART Optimization V2 by veez21 @ xda, it is adapted for today, at least Android 10-15. It is not a project made to be serious, it is just made for fun.

## Features
- Set SystemUi and System_Server to more efficient profiles for use. This improves the accuracy of memory management and even cleans it up with HeapTaskDaemon, the System_Server garbage collector.
- Reduces useless ART debugging and logging, considering that regular users would have a hard time getting this information without a computer. This also reduces the size of applications by a few megabytes; in my case, it made Minecraft Pocket weigh 30MB less.
- Apply the speed-profile to all user apps every 7 days, and at the end of each month (30 days after the module was installed), DEX file synchronization, image compilation, and unused DEX file cleaning are applied. In addition: allow the user to modify the timing of these optimizations, dividing them between: speed-profile and final clean.
- Pin dex2oat threads to big cores, enable batch parallelism which makes compilation and runtime movement execution faster, reducing batch time by ~20%.
- And best of all... it's Open Source! If you want to help this project with additional optimizations, tips, etc., let me know, I'd really appreciate help with this project that I made with the purpose of being fun and a way to pass the time.

### Warning!
If you use it together with my Basic Cleaner module, remember to set the same speed-profile and final cleaning times in the panels of this module and the basic cleaner. Don't worry, both will not run at the same time. Whereas the basic cleaner and basic runtime when run, they will check the period between them. The first one that runs will cancel the execution of the second one because it is in the same "period".
