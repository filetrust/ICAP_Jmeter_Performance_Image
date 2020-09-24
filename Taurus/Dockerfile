# Use a minimal base image with OpenJDK installed
FROM openjdk:8-jre

# Install packages
RUN apt-get update && \
#    apt-get -y install python-pip  \
#    pip install awscli     \
    apt-get -y install python3.7  && \
    apt-get -y install python3-pip &&\
#    apt-get -y install python3-pip     \
#    pip3 install boto3     \
	apt-get -y install c-icap 
	
# Install Taurus
RUN pip3 install bzt    
# Make Directories
RUN mkdir -p /home/ubuntu/icap/input/ && \
    mkdir -p /home/ubuntu/icap/output && \
    mkdir -p /Test/Results/


# Set variables
ENV JMETER_HOME=/root/usr/share/apache-jmeter \
    JMETER_VERSION=5.2.1 \
    WEB_SOCKET_SAMPLER_VERSION=1.2 \
    JMETER_PLUGINS_MANAGER_VERSION=1.4 \
    CMDRUNNER_VERSION=2.2 \
    JSON_LIB_VERSION=2.4 \
    JSON_LIB_FULL_VERSION=${JSON_LIB_VERSION}-jdk15  \
    NUMBER_OF_FILES_UNDER_LIB=166  \
    NUMBER_OF_FILES_UNDER_LIB_EXT=81  \
#    CONVERT_JSON_PYTHON_SCRIPT=/Test/xml_to_json.py \
#    GET_FILE_DATA_PYTHON_SCRIPT=/Test/get_file_data.py \
#    UPLOAD_RESULTS_SCRIPT=/Test/upload_results.py \
#    DYNAMODB_RESULTS_TABLE_NAME=FileRebuildPerformanceTest-Results \
    TEST_SCRIPT_FILE=/Test/ICAP.jmx \
    HTML_REPORT=/Test/HTML_REPORT \
#    DYNAMODB_TEST_DATA_TABLE_NAME=RebuildApiPerformanceTests-FileData \
#   FILE_DATA_FILE=/Test/FileData.json \
    TEST_LOG_FILE=/Test/test.log \
    TEST_RESULTS_PATH=/Test/Results/ICAP.csv \
#    TEST_RESULTS_JSON_PATH=/Test/Results/FileRebuildResults.json \
#    AWS_ACCESS_KEY_ID=test \
#    AWS_SECRET_ACCESS_KEY=test \
#    AWS_DEFAULT_REGION=eu-west-1 \
    PATH="~/.local/bin:$PATH" \
    JVM_ARGS="-Xms2048m -Xmx4096m -XX:NewSize=1024m -XX:MaxNewSize=2048m -Duser.timezone=UTC" \
    ICAP_SCRIPT=/home/ubuntu/icap \
    INPUT_FOLDER=/home/ubuntu/icap/input/ \
    OUTPUT_FOLDER=/home/ubuntu/icap/output 
    
# Install Apache JMeter
# RUN wget http://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz && \
#     tar zxvf apache-jmeter-${JMETER_VERSION}.tgz && \
#     rm -f apache-jmeter-${JMETER_VERSION}.tgz && \
#     mv apache-jmeter-${JMETER_VERSION} ${JMETER_HOME}

# Install Plugin Manager
# RUN cd /tmp/ &&\
#     wget -O jmeter-plugins-manager-1.4.jar http://search.maven.org/remotecontent?filepath=kg/apc/jmeter-plugins-manager/1.4/jmeter-plugins-manager-1.4.jar && \
#     wget -O cmdrunner-2.2.jar http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar && \
#     wget -O json-lib-2.4-jdk15.jar https://sourceforge.net/projects/json-lib/files/json-lib/json-lib-2.4/json-lib-2.4-jdk15.jar/download && \
#     mv /tmp/jmeter-plugins-manager-1.4.jar ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-1.4.jar && \
#     mv /tmp/cmdrunner-2.2.jar ${JMETER_HOME}/lib/cmdrunner-2.2.jar &&\
#     mv /tmp/json-lib-2.4-jdk15.jar ${JMETER_HOME}/lib/json-lib-2.4-jdk15.jar &&\
#     java -cp ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller && \
#     chmod +x ${JMETER_HOME}/bin/PluginsManagerCMD.sh &&\
#     ${JMETER_HOME}/bin/PluginsManagerCMD.sh install bzm-parallel=0.9 &&\
#     ${JMETER_HOME}/bin/PluginsManagerCMD.sh install jpgc-casutg=2.9

# Copy Test Script and File Data
COPY ICAP.jmx ${TEST_SCRIPT_FILE}
COPY script.sh ${ICAP_SCRIPT}
RUN chmod +x ${ICAP_SCRIPT}
COPY icap.yml /Test
RUN chmod +x /Test/icap.yml
#COPY xml_to_json.py ${CONVERT_JSON_PYTHON_SCRIPT}
#COPY upload_results.py ${UPLOAD_RESULTS_SCRIPT}
#COPY get_file_data.py ${GET_FILE_DATA_PYTHON_SCRIPT}

# Copy Test Data
ADD testData ${INPUT_FOLDER}
    
#CMD $JMETER_HOME/bin/jmeter -n -t $TEST_SCRIPT_FILE -j $TEST_LOG_FILE -l $TEST_RESULTS_PATH
   
#CMD echo "\n\n===== RETRIEVING FILE DATA =====\n\n"    \
#    python3.7 $GET_FILE_DATA_PYTHON_SCRIPT -j $FILE_DATA_FILE -t $DYNAMODB_TEST_DATA_TABLE_NAME    \
#    echo "\n\n===== RUNNING TESTS =====\n\n"   \
#    $JMETER_HOME/bin/jmeter -n -t $TEST_SCRIPT_FILE -j $TEST_LOG_FILE  \
#    echo "\n\n===== TEST LOGS =====\n\n"   \
#    cat $TEST_LOG_FILE     \
#    echo "\n\n===== TEST RESULTS =====\n\n"    \
#    cat $TEST_RESULTS_PATH     \
#    echo "\n\n===== CONVERTING XML =====\n\n"  \
#    python3.7 $CONVERT_JSON_PYTHON_SCRIPT -i $TEST_RESULTS_PATH -o $TEST_RESULTS_JSON_PATH     \
#    echo "\n\n===== UPLOADING RESULTS =====\n\n"   \
#    python3.7 $UPLOAD_RESULTS_SCRIPT -j $TEST_RESULTS_JSON_PATH -t $DYNAMODB_RESULTS_TABLE_NAME    


