//
//  ViewController.m
//  TableViewDynamicSize
//

#import "ViewController.h"

@interface ViewController () {
    NSUInteger correctedHeight;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:@"image2.jpg"];
    
    correctedHeight = 375 / self.imageView.image.size.width * self.imageView.image.size.height;
    
    [self.imageView removeConstraint: self.imageView.constraints.lastObject] ;
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    
    [self.imageView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant: correctedHeight]];

}

@end
