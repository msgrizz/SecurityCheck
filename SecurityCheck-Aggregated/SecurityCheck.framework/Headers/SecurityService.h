//
//  SecurityManager.h
//  SecurityCheck
//
//  Created by Mihail Salari on 7/9/18.
//  Copyright © 2018 ICS "Endava" SRL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecurityService : NSObject

+ (void) rootCheck:(void (^)(void))blockCompletion;
+ (void) debugCheck:(void (^)(void))blockCompletion;

@end
