#!/system/bin/sh
# if Magisk change its mount point in the future
MODDIR=${0%/*}

# Wait some time... to apply cleaner script
sleep 120

# Configuration panel path
PANEL_FILE="/storage/emulated/0/Android/panel_runtime.txt"

# pre-set configurations
if [ ! -e $PANEL_FILE ]; then
    echo "ART-PROFILE=604800" > $PANEL_FILE
    echo "FINALCLEAN=2592000" >> $PANEL_FILE
fi

# ART Compilation Section
# Log file location
LOG_FILE=/storage/emulated/0/Android/AppComp.log

#Interval between compilation runs, in seconds, 604800 = 7 days
RUN_EVERY=$(grep "^ART-PROFILE=" $PANEL_FILE | cut -d'=' -f2)

# Get the last modify date of the Log file, if the file does not exist, set value to 0
if [ -e $LOG_FILE ]; then
    LASTRUN=`stat -t $LOG_FILE | awk '{print $14}'`
else
    LASTRUN=0
fi;

# Get current date in epoch format
CURRDATE=`date +%s`

# Check the interval
INTERVAL=$(expr $CURRDATE - $LASTRUN)

# If interval is more than the set one, then run the main script
if [ $INTERVAL -gt $RUN_EVERY ];
then
    if [ -e $LOG_FILE ]; then
        rm $LOG_FILE;
    fi;

    echo "ART profile for user apps started at $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE;
    echo "ART profile is applying" | tee -a $LOG_FILE;

    for app in $(pm list packages -3 | cut -f 2 -d ":"); do
        echo "Compiling $app..." | tee -a $LOG_FILE;
        pm compile -m speed-profile --full $app
    done
	
	echo "ART profile for user apps finished at $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE;
	echo "------------------------------------------------" | tee -a $LOG_FILE;
fi;
#-----------------------------------------------------------------------------------

# ART Sincronization and Cleaning
# Log file location
LOG_FILE=/storage/emulated/0/Android/cleanART.log

#Interval between final cleaning runs, in seconds, 2592000 = 30 days
RUN_EVERY=$(grep "^FINALCLEAN=" $PANEL_FILE | cut -d'=' -f2)

# Get the last modify date of the Log file, if the file does not exist, set value to 0
if [ -e $LOG_FILE ]; then
    LASTRUN=`stat -t $LOG_FILE | awk '{print $14}'`
else
    LASTRUN=0
fi;

# Get current date in epoch format
CURRDATE=`date +%s`

# Check the interval
INTERVAL=$(expr $CURRDATE - $LASTRUN)

# If interval is more than the set one, then run the main script
if [ $INTERVAL -gt $RUN_EVERY ];
then
    if [ -e $LOG_FILE ]; then
        rm $LOG_FILE;
    fi;

	echo "ART Cleaning started at $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE;
	echo "Clean unnecessary DEX files" | tee -a $LOG_FILE;

	pm reconcile-secondary-dex-files -a
    pm compile --compile-layouts -a
	pm art cleanup
	
	echo "ART Cleaning finished at $( date +"%m-%d-%Y %H:%M:%S" )" | tee -a $LOG_FILE;
	echo "------------------------------------------------" | tee -a $LOG_FILE;
fi;
