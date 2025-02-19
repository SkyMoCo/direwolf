# Try to find MQTT library
#
# MQTT_FOUND - system has MQTT installed
# MQTT_LIBRARIES - location of the library for MQTTlib
# MQTT_INCLUDE_DIRS - location of the include files for MQTTlib
#
# Requires these CMake modules:
#  FindPackageHandleStandardArgs (known included with CMake >=2.6.2)
#
# Original Author:
# 2019 Davide Gerhard <rainbow@irh.it>
# 2025 Kevin Smolkowski 

##set(MQTT_ROOT_DIR
#  "${MQTT_ROOT_DIR}"
#  CACHE
#  PATH
#  "Directory to search for MQTT")

#find_package(PkgConfig QUIET)
#if(PKG_CONFIG_FOUND)
#  pkg_check_modules(PC_MQTT MQTT)
#endif()

find_path(MQTT_INCLUDE_DIR
  NAMES MQTTClient.h
  PATHS
  /usr/include
  /usr/local/include
  /opt/local/include
  HINTS
  ${PC_MQTT_INCLUDEDIR}
  ${MQTT_ROOT_DIR}
  )

find_library(MQTT_LIBRARY
  NAMES libpaho-mqtt3c.so
  PATHS
  /usr/local/lib
  /opt/local/lib
  HINTS
  ${MQTT_ROOT_DIR}
  )

#include(FindPackageHandleStandardArgs)
#find_package_handle_standard_args(MQTT
#  DEFAULT_MSG
#  MQTT_LIBRARY
#  MQTT_INCLUDE_DIR
#  )

if(MQTT_LIBRARY)
  message(STATUS "Including MQTT_LIBRARY")
  list(APPEND MQTT_LIBRARY ${MQTT_LIBRARY})
  list(APPEND MQTT_INCLUDE_DIRS ${MQTT_INCLUDE_DIR})
  set(MQTT_FOUND "TRUE")
endif()

mark_as_advanced(MQTT_INCLUDE_DIR MQTT_LIBRARY)
