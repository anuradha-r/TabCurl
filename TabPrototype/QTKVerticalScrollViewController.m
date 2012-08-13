//
//  QTKVerticalScrollViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/13/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKVerticalScrollViewController.h"

#define kNoOfSlidebarThumbnails 15
#define kThumbnailVerticalPadding 20
#define kThumbnailHorizontalPadding 30

@implementation QTKVerticalScrollViewController
@synthesize thumbnails;
@synthesize scrollView;

- (id)init{
    return [self initWithNibName:@"QTKVerticalScrollViewController" bundle:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self layoutThumbnails];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(void)layoutThumbnails{
    CGPoint start = CGPointMake(10, 25);
    CGPoint currentPos = start;
    int noOfRows = 0;
    for(int i = 0; i < kNoOfSlidebarThumbnails; ){
        UIImageView *thumbnail = [self slideBarThumbnail];
        CGRect frame = thumbnail.frame;
        [thumbnail setFrame:CGRectMake(currentPos.x,currentPos.y,frame.size.width,frame.size.height)];
        [self.scrollView addSubview:thumbnail];
        i++;
        if(i!=0 && i%4 == 0){
            currentPos.x = start.x ;
            currentPos.y = start.y  + noOfRows * (100 + kThumbnailVerticalPadding )+ thumbnail.frame.size.height + kThumbnailVerticalPadding;
            noOfRows ++;
        }else{
            currentPos.x = currentPos.x + thumbnail.frame.size.width + kThumbnailHorizontalPadding;    
        }
        
        
    }
    CGFloat height = noOfRows * (100 + kThumbnailVerticalPadding) + 500;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, height )];
}

- (UIImageView *)slideBarThumbnail{
    UIImageView *thumbnail = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 225, 100)];
    [thumbnail setBackgroundColor:[UIColor greenColor]];
    return thumbnail;
}
@end
