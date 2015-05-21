//
//  NSDocument+ImportSorter.m
//  ImportSorter
//
//  Created by Jun Hashimoto on 2015/05/21.
//  Copyright (c) 2015年 Jun Hashimoto. All rights reserved.
//

// :: Framework ::
#import <objc/runtime.h>
// :: Other ::
#import "ImportSorter.h"
#import "NSDocument+ImportSorter.h"

static BOOL sortOnSave;

@implementation NSDocument (ImportSorter)

- (void)isSaveDocumentWithDelegate:(id)delegate
                    didSaveSelector:(SEL)didSaveSelector
                        contextInfo:(void *)contextInfo
{
    if (sortOnSave) {
        [[ImportSorter sharedPlugin] sortImport];
    }

    [self isSaveDocumentWithDelegate:delegate
                      didSaveSelector:didSaveSelector
                          contextInfo:contextInfo];
}

+ (void)load
{
    Method original, swizzle;

    original = class_getInstanceMethod(
        self, NSSelectorFromString(@"saveDocumentWithDelegate:didSaveSelector:contextInfo:"));
    swizzle = class_getInstanceMethod(
        self, NSSelectorFromString(@"isSaveDocumentWithDelegate:didSaveSelector:contextInfo:"));

    method_exchangeImplementations(original, swizzle);
}

+ (BOOL)sortOnSave {
    return sortOnSave;
}

+ (void)setSortOnSave:(BOOL)sos {
    sortOnSave = sos;
}

@end