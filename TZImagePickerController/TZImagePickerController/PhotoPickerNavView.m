//
//  PhotoPickerNavView.m
//  TZImagePickerController
//
//  Created by xinweizhou on 2021/12/1.
//  Copyright © 2021 谭真. All rights reserved.
//

#import "PhotoPickerNavView.h"
#import "NSBundle+TZImagePicker.h"

@interface PhotoPickerNavView()
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UIImageView *titleImageV;

@end

@implementation PhotoPickerNavView {
    BOOL _isUp;
}

- (IBAction)gestureClicked:(UITapGestureRecognizer *)sender {
    
    if (self.titleClicked != nil) {
        self.titleClicked(_isUp);
    }
    
    
}
- (IBAction)cancelBtnClicked:(UIButton *)sender {
    if (self.cancelClicked != nil) {
        self.cancelClicked();
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSBundle *imageBundle = [NSBundle tz_imagePickerBundle];
    NSString *name = [@"takePicture80" stringByAppendingString:@"@2x"];
    NSString *imagePath = [imageBundle pathForResource:name ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    self.titleImageV.image = image;
}

- (void)setTitle:(NSString *)title direction:(BOOL)up {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        self.titleL.text = title;
        if (up == YES) {
            self.titleImageV.transform = CGAffineTransformMakeRotation(M_PI);
        } else {
            self.titleImageV.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished) {
        if (finished) {
            self->_isUp = up;
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
