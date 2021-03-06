//------------------------------------------------
// The Virtual Monte Carlo examples
// Copyright (C) 2007 - 2014 Ivana Hrivnacova
// All rights reserved.
//
// For the licensing terms see geant4_vmc/LICENSE.
// Contact: root-vmc@cern.ch
//-------------------------------------------------

/// \ingroup E03
/// \file E03/test_E03_pl.C
/// \brief Macro for running Example03 with Geant4.

void test_E03_pl(const TString& configMacro = "g4ConfigEnv.C")
{
/// Macro function for running Example03 with Geant4 from
/// Root interactive session
/// \param configMacro configuration macro name, default \ref E03/g4Config.C 

  // Create application if it does not yet exist
  Bool_t needDelete = kFALSE;
  if ( ! TVirtualMCApplication::Instance() ) {
    new Ex03MCApplication("Example03", "The example03 MC application");
    needDelete = kTRUE;
  }  
 
  // MC application
  Ex03MCApplication* appl 
    = (Ex03MCApplication*)TVirtualMCApplication::Instance();
  appl->InitMC(configMacro);
  
  appl->RunMC(1);
  
  if ( needDelete ) delete appl;
}

