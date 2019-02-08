#!/bin/sh -e

#    Licensed to the Apache Software Foundation (ASF) under one or more
#    contributor license agreements.  See the NOTICE file distributed with
#    this work for additional information regarding copyright ownership.
#    The ASF licenses this file to You under the Apache License, Version 2.0
#    (the "License"); you may not use this file except in compliance with
#    the License.  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

logback_file=${NIFI_HOME}/conf/logback.xml
logger_xpath='/configuration/logger'

# Update the given logger value
# Example:  edit_attribute "org.apache.nifi.web.security" "DEBUG"
edit_attribute() {
  logger_name=$1
  level_value=$2

  if [ -n "${level_value}" ]; then
    echo "Setting debug logging $logger_name=$level_value for $logback_file"
    xmlstarlet ed --inplace -u "${logger_xpath}[@name='${logger_name}']/@level" -v "${level_value}" "${logback_file}"
  fi
}

is_var_defined()
{
    if [ $# -ne 1 ]
    then
        echo "Expected exactly one argument: variable name as string, e.g., 'my_var'"
        exit 1
    fi
    eval "[ ! -z \"\$$1\" ]"
    rc=$?
    return $rc
}

# Its expected that the NIFI_DEBUG environment variable follow this convention
# export NIFI_DEBUG="org.apache.nifi.web.security=DEBUG,org.apache.nifi.authorization=DEBUG,org.apache.nifi.web.api.config=TRACE"

if is_var_defined NIFI_DEBUG ; then
    echo "Enabling NiFI debug logging"
    IFS=',' read -r -a logger_array <<< "$NIFI_DEBUG"
    for logger_element in "${logger_array[@]}"
    do
        echo "split logger_element=$logger_element"
        # if a word contains an "="...
        if [[ $logger_element = *"="* ]]; then
            vars[${word%%=*}]=${word#*=}
            logger_name=${logger_element%%=*}
            logger_value=${logger_element#*=}
            echo "logger_name=$logger_name, logger_value=$logger_value"
            edit_attribute $logger_name $logger_value
        fi
    done
fi


