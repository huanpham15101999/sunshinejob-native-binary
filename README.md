# Gen config lần đầu
java -agentlib:native-image-agent=config-output-dir=conf -cp "lib/*:sunshinejob-1.0-SNAPSHOT.jar" com.vtb.job.SunshineEntryJob a b 1

# Build file native binary
native-image -cp "sunshinejob-1.0-SNAPSHOT.jar:lib/*" com.vtb.job.SunshineEntryJob -H:ConfigurationFileDirectories=conf --no-fallback

# Run file native binary to check without ssl
./com.vtb.job.SunshineEntryJob $ip $port 1 (no ssl)

# Run file native binary to check with ssl
./com.vtb.job.SunshineEntryJob $ip $port 2 (ssl)
