# ICAP_Jmeter_Performance_Image

## Clone Repo from Git

1. Open a Terminal Window
2. Navigate to where you'd like to store the repo
3. Run this command ```CMD git clone https://github.com/filetrust/ICAP_Jmeter_Performance_Image.git ```

## Execute Script

1. Navigate to .\ICAP_Jmeter_Performance_Image\Docker\testData and add any files you want to test with
2. Navigate to ICAP_Jmeter_Performance_Image\Docker
3. Run this command ```CMD docker build -t icap_jmeter_perf_image . ```

The script ICAP.jmx will be executed by the Docker build.

## Validate Your Files

1. Connect to the Docker Image ```CMD docker run -it icap_jmeter_performance_image ```
2. Execute this command to see your rebuilt files ```CMD ls ${OUTPUT_FOLDER} ```