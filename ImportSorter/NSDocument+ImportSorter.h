//
//  NSDocument+ImportSorter.h
//  ImportSorter
//
//  Created by Jun Hashimoto on 2015/05/21.
//  Copyright (c) 2015年 Jun Hashimoto. All rights reserved.
//

// :: Framework ::
#import <Cocoa/Cocoa.h>

@interface NSDocument (ImportSorter)

+ (BOOL)sortOnSave;
+ (void)setSortOnSave:(BOOL)sortOnSave;

@end