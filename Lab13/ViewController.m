//
//  ViewController.m
//  Lab13
//
//  Created by Yusuke K on 2022-09-14.
//

#import "ViewController.h"

@interface ViewController ()
@property(readonly) NSString* keyword;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _keyword = @"red";
    _DynamicTextField.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSRange spaceSecondToLast = [textField.text rangeOfString: @" " options: NSBackwardsSearch];
    NSUInteger start = spaceSecondToLast.length == 0 ? 0 : spaceSecondToLast.location + 1;
    NSRange textRange = NSMakeRange(start, range.location - start);
    NSString *text = [textField.text substringWithRange: textRange];
    NSDictionary *attr = @{ NSForegroundColorAttributeName : [UIColor blackColor] };
    
    if([[text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] > 0) {
        if([[text lowercaseString] isEqualToString: _keyword]) {
            attr = @{ NSForegroundColorAttributeName : [UIColor redColor] };
        }
        
        NSMutableAttributedString *newText = [textField.attributedText mutableCopy];
        [newText addAttributes:attr range: textRange];
        [textField setAttributedText: newText];
    }
    
    return YES;
}

@end
