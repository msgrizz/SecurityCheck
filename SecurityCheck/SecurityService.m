//
//  SecurityManager.m
//  SecurityCheck
//
//  Created by Mihail Salari on 7/9/18.
//  Copyright © 2018 ICS "Endava" SRL. All rights reserved.
//

#import "SecurityService.h"
#import "fileCheck.h"
#import "forkCheck.h"
#import "debugCheck.h"

@interface SecurityService()
  
//--------------------------------
// Callback block from checks
//--------------------------------
typedef void (^cbBlock) (void);

@end

@implementation SecurityService

-(id) init {
  self = [super init];
  return self;
}
  
+ (void)rootCheck:(void (^)(void))blockCompletion {
  //**
  //** JB test
  
  //-----------------------------------
  // call JB/Root weHaveAProblem
  //-----------------------------------
  cbBlock chkCallback  = ^{
    
    __weak id weakSelf = self;
    
    if (weakSelf) blockCompletion();
  };
  
  //-----------------------------------
  // jailbreak/Root detection
  //-----------------------------------
  checkFork(chkCallback);
  checkFiles(chkCallback);
  checkLinks(chkCallback);
}
  
+ (void)debugCheck:(void (^)(void))blockCompletion {
  //-------------------------------------------
  // do not allow debuggers
  //-------------------------------------------
  //dbgStop;
  
  //-------------------------------------------
  // check for the presence of a debugger
  // call weHaveAProblem if there is one
  //-------------------------------------------
  cbBlock dbChkCallback  = ^{
    
    __weak id weakSelf = self;
    
    if (weakSelf) blockCompletion();
    
  };
  
  dbgCheck(dbChkCallback);
}

@end
