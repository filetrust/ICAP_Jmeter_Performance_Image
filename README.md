# ICAP_Jmeter_Performance_Image

## Clone Repo from Git

1. Open a Terminal Window
2. Navigate to where you'd like to store the repo
3. Run this command ```git clone https://github.com/filetrust/ICAP_Jmeter_Performance_Image.git ```

## Execute Script

1. Navigate to .\ICAP_Jmeter_Performance_Image\Docker\testData and add any files you want to test with
2. Navigate to ICAP_Jmeter_Performance_Image\Docker
3. Run this command ```docker build -t icap_jmeter_perf_image . ```

The script ICAP.jmx will be executed by the Docker build.

## Validate Your Files

1. Connect to the Docker Image ```docker run -it icap_jmeter_performance_image ```
2. Execute this command to see your rebuilt files ```ls ${OUTPUT_FOLDER} ```

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

You will now be able to execute this shell script in the linux environment and should see no errors from executing the jmx script on running the build command