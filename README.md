# ICAP_Jmeter_Performance_Image

## Clone Repo from Git

1. Open a Terminal Window
2. Navigate to where you'd like to store the repo
3. Run this command ```git clone https://github.com/filetrust/ICAP_Jmeter_Performance_Image.git ```

## Execute ICAP Server Test Script

1. Navigate to .\ICAP_Jmeter_Performance_Image\ICAP_Server_Test\testData and add any files you want to test with
2. Navigate to ICAP_Jmeter_Performance_Image\ICAP_Server_Test
3. Run this command ```docker build -t icap_jmeter_perf_image . ```
4. Run this command to Connect to the Docker Image ```docker run -it icap_jmeter_perf_image ```
4. Run this command from docker to run jmx script ```$JMETER_HOME/bin/jmeter -n -t $TEST_SCRIPT_FILE -j $TEST_LOG_FILE -l $TEST_RESULTS_PATH```
5. Run this command from docker to generate HTML result from csv ```$JMETER_HOME/bin/jmeter -g $TEST_RESULTS_PATH -o $HTML_REPORT```
6. Run this command on your local terminal to copy result to your local directory ```docker cp <dockerimageid>:/Test/ <local destination where you want to write file to>```

## Validate Your Files

1. Execute this command to see your rebuilt files ```ls ${OUTPUT_FOLDER} ```

## Execute Taurus Perf Test

1. Navigate to .\ICAP_Jmeter_Performance_Image\Taurus\testData and add any files you want to test with
2. Navigate to ICAP_Jmeter_Performance_Image\Taurus
3. Run this command ```docker build -t icap_taurus . ```
4. Run this command to Connect to the Docker Image ```docker run -it icap_taurus ```
5. Navigate to Test folder in docker image where yaml file is ```cd Test```
4. Run this command from docker to execute test using Taurus ```bzt icap.yml```
5. Run this command from docker to generate HTML result from csv ```$JMETER_HOME/bin/jmeter -g $TEST_RESULTS_PATH -o $HTML_REPORT```
6. Run this command on your local terminal to copy result to your local directory ```docker cp <dockerimageid>:/Test/ <local destination where you want to write file to>```

**** You can update yml file for diffrent load patterns as required before building image****
```yaml
execution:
- concurrency: 100
  ramp-up: 10
  hold-for: 1
  scenario: with_script
```


## Troubleshooting

### Shell Script Line Endings
Currently we have a known issue with the shell script 'script.sh'. When you clone this repo the script will have windows compatible line endings (CR LF)
These need to be changed to linux compatible line endings (LF) in order for the script to be run in the linux environment.
There is a simple work around for this

1. After you have cloned the repo open the script.sh file in notepad++
2. To check the line endings see the bottom right hand corner of the window. (There is a box displaying the current line ending format)
3. If this says Windows (CR LF) use the right mouse click on this box. A drop down list will appear
4. Select the option Unix (LF)
5. Save the file

or alternatively you can install ```sudo apt-get install dos2unix``` and run ```dos2unix -n file.txt output.txt``

You will now be able to execute this shell script in the linux environment and should see no errors from executing the jmx script on running the build command

### Execute Proxy Site Test
TBC
