#This PowerShell script is to set the core affinity of a process.
#Please note that processor affinity uses a bitmask for value.


try
{
 #get process
 $process = get-process [processname] -ErrorAction Stop

 #record the val
 $a = $process.ProcessorAffinity

 #modify the val
 $process.ProcessorAffinity = 3

 #record the val
 $b = $process.ProcessorAffinity

 #set state
 $state = "ran sucessfully. Processor affinity changed from $a to $b."
}
catch
{
 #write failure to logfile
 $time = get-date
 $errorMess = $_.Exception.Message
 "This script failed at $time with: $errorMess" | out-file c:\logs\outputlog.log -append

 #set state
 $state = "failed. See outputlog.log for more detail."
}
finally
{
 #write run to logfile.
 $time = get-date
 "Executed $time> process $state" | out-file c:\logs\outputlog.log -append
}
