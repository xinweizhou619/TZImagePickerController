//
//  PhotoPickerNavView.h
//  TZImagePickerController
//
//  Created by xinweizhou on 2021/12/1.
//  Copyright © 2021 谭真. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PhotoPickerNavView : UIView
@property(nonatomic, copy) void(^cancelClicked)();
@property(nonatomic, copy) void(^titleClicked)(BOOL);

- (void)setTitle:(NSString *)title direction:(BOOL)up;

@end

NS_ASSUME_NONNULL_END
