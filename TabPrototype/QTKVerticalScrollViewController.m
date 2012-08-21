//
//  QTKVerticalScrollViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/13/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKVerticalScrollViewController.h"

#define kNoOfSlidebarThumbnails 11
#define kThumbnailVerticalPadding 20
#define kThumbnailHorizontalPadding 20

@interface QTKVerticalScrollViewController(){
    NSMutableArray *thumbnails;    
}
@end 

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

- (void)viewDidAppear:(BOOL)animated{
    //[self animateScrollView];
    [self animateThumbnailAtIndex:0];    
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
        [thumbnail setFrame:CGRectMake(currentPos.x,currentPos.y + 100,frame.size.width,frame.size.height)];
        [self.scrollView addSubview:thumbnail];
        i++;
        if(i!=0 && i%6 == 0){
            currentPos.x = start.x ;
            currentPos.y = start.y  + noOfRows * (150 + kThumbnailVerticalPadding )+ thumbnail.frame.size.height + kThumbnailVerticalPadding;
            noOfRows ++;
        }else{
            currentPos.x = currentPos.x + thumbnail.frame.size.width + kThumbnailHorizontalPadding;    
        }
        if(thumbnails){
            thumbnails = [[NSMutableArray alloc]init];
        }
        [thumbnails addObject:thumbnail];
    }
    CGFloat height = noOfRows * (150 + kThumbnailVerticalPadding) + 500;
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, height )];
}

- (UIImageView *)slideBarThumbnail{
    UIImageView *thumbnail = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    [thumbnail setBackgroundColor:[UIColor cyanColor]];
    return thumbnail;
}

/*- (void)animateScrollView{
  [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
      CGRect frame = self.scrollView.frame;
      frame.origin.y = frame.origin.y - 400;
      self.scrollView.frame = frame;
  } completion:nil];    
}*/

- (void)animateThumbnailAtIndex:(int)i{
    __block int index = i;
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        UIImageView *thumbnail = [[self.scrollView subviews]objectAtIndex:index];
            CGRect frame = thumbnail.frame;
            frame.origin.y = frame.origin.y - 100;
            thumbnail.frame = frame;
        }
        completion:^(BOOL finished) {
            index++;
            if(index >= [[self.scrollView subviews]count])
                return;
            else{
                [self animateThumbnailAtIndex:index];
            }
        }];        
}
 
@end
