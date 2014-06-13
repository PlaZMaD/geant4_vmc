#------------------------------------------------
# The Virtual Monte Carlo packages
# Copyright (C) 2014 Ivana Hrivnacova
# All rights reserved.
#
# For the licensing terms see geant4_vmc/LICENSE.
# Contact: vmc@pcroot.cern.ch
#-------------------------------------------------

# Configuration file for CMake build for VMC applications.
# It finds all required and selected packages and sets
# - VMC_FOUND
#
# I. Hrivnacova, 26/02/2014

#---Options---------------------------------------------------------------------
option(VMC_WITH_GEANT4   "Build with Geant4" OFF)
option(VMC_WITH_GEANT3   "Build with Geant3" OFF)
option(BUILD_SHARED_LIBS "Build the dynamic libraries" ON)

#---Find required packages------------------------------------------------------

set(VMC_FOUND FALSE)

# ROOT (required)
find_package(ROOT REQUIRED)

# MTRoot
find_package(MTRoot REQUIRED)

# Geant4 
if(VMC_WITH_GEANT4)
  # Geant4VMC  
  # (it includes also Geant4 configuration options used in Geant4 VMC installation)
  set(Geant4VMC_DIR "" CACHE PATH "Directory where Geant4VMC is installed")
  find_package(Geant4VMC REQUIRED)      

  # Geant4
  set(_components)
  if(Geant4VMC_USE_GEANT4_UI)
    list(APPEND _components ui_all)
  endif()
  if(Geant4VMC_USE_GEANT4_VIS)
    list(APPEND _components vis_all)
  endif()
  if(Geant4VMC_USE_GEANT4_G3TOG4)
    list(APPEND _components g3tog4)
  endif()
  find_package(Geant4 REQUIRED ${_components})
  add_definitions(-DUSE_GEANT4)

  # VGM
  if (Geant4VMC_USE_VGM)
    find_package(VGM REQUIRED)      
  endif()
endif()

# Geant3
if(VMC_WITH_GEANT3)
  find_package(Geant3 REQUIRED)
  #PYTHIA6
  find_package(Pythia6 REQUIRED)
endif()

# If all required packages above were found we can update VMC_FOUND
set(VMC_FOUND TRUE)
