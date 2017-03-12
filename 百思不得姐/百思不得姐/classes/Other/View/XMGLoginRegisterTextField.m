//
//  XMGLoginRegisterTextField.m
//  百思不得姐
//
//  Created by Jackeylove on 2017/3/8.
//  Copyright © 2017年 Jackeylove. All rights reserved.
//

#import "XMGLoginRegisterTextField.h"

static NSString *const XMGPlaceholderColorKey = @"placeholderLabel.textColor";
@interface XMGLoginRegisterTextField ()<UITextFieldDelegate>
@property(nonatomic,strong)id observer;
@end

@implementation XMGLoginRegisterTextField

-(void)awakeFromNib{

    [super awakeFromNib];
    self.tintColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing) name:UITextFieldTextDidBeginEditingNotification object:self];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing) name:UITextFieldTextDidEndEditingNotification object:self];
    
   self.observer= [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidBeginEditingNotification object:self queue:[[NSOperationQueue alloc]init] usingBlock:^(NSNotification * _Nonnull note) {
        
        
    }];
//    self.delegate = self;
//    [self addTarget:self action:@selector(editingDidBegin) forControlEvents:UIControlEventEditingDidBegin];
//    [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd ];
}

#pragma mark - UITextFieldDelegate

-(void)beginEditing {
    [self setValue:[UIColor whiteColor] forKeyPath:XMGPlaceholderColorKey];
}

-(void)endEditing {

    [self setValue:[UIColor grayColor] forKeyPath:XMGPlaceholderColorKey];
}
-(void)dealloc {

    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [[NSNotificationCenter defaultCenter]removeObserver:self.observer];
}
//-(void)textFieldDidBeginEditing:(UITextField *)textField {
//
//    [self setValue:[UIColor whiteColor] forKeyPath:XMGPlaceholderColorKey];
//}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField {
//
//    [self setValue:[UIColor grayColor] forKeyPath:XMGPlaceholderColorKey];
//}

//-(void)editingDidBegin {
//
//    [self setValue:[UIColor whiteColor] forKeyPath:XMGPlaceholderColorKey];
//}
//
//-(void)editingDidEnd {
//
//    [self setValue:[UIColor grayColor] forKeyPath:XMGPlaceholderColorKey];
//}

//    [self setValue:[UIColor whiteColor] forKeyPath:XMGPlaceholderColorKey];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        UILabel *label = self.subviews.firstObject;
//        label.textColor = [UIColor whiteColor];
//    });
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:dict];
    
//    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:self.placeholder];
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[NSForegroundColorAttributeName] = [UIColor redColor];
//    dict[NSBackgroundColorAttributeName] = [UIColor yellowColor];
//    [string addAttributes:dict range:NSMakeRange(0, 1)];
//    
//    self.attributedPlaceholder = string;





//-(void)drawPlaceholderInRect:(CGRect)rect {
//
//    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    attributes[NSFontAttributeName] = self.font;
//    
//    CGRect placeholderRect;
//    placeholderRect.size.width = self.frame.size.width;
//    placeholderRect.size.height = self.font.lineHeight;
//    placeholderRect.origin.x = 0;
//    placeholderRect.origin.y = (self.frame.size.height - self.font.lineHeight) / 2;
//    [self.placeholder drawInRect:placeholderRect withAttributes:attributes];
//}
@end
