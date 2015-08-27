//
//  IKFoundation.m
//  ios-kzplayground
//
//  Created by Aaron Wang on 8/27/15.
//  Copyright (c) 2015 inetfuture. All rights reserved.
//

#import "IKFoundation.h"

@implementation IKFoundation

- (void)setup {
    KZPShow(@"Setup snapshot");
}

- (void)run {
    UITextView *textView = [[UITextView alloc] initWithFrame:self.worksheetView.frame];
    textView.font = [UIFont boldSystemFontOfSize:20];
    textView.textContainer.lineBreakMode = NSLineBreakByCharWrapping;
    [self.worksheetView addSubview:textView];

    @try {
        id toSerialize = nil;
        toSerialize = @{ @"a" : textView };
        [NSJSONSerialization dataWithJSONObject:toSerialize options:0 error:nil];
    } @catch (NSException *exception) {
        textView.text = [exception description];
    }
}

@end
