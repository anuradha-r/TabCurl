//
//  QTKScrollBarViewController.m
//  TabPrototype
//
//  Created by Ramprakash, Anuradha on 8/10/12.
//  Copyright (c) 2012 Q Technology Company. All rights reserved.
//

#import "QTKScrollBarViewController.h"

@interface QTKScrollBarViewController ()

@end

#define kNoOfSlidebarThumbnails 9
#define kThumbnailVerticalPadding 20
#define kThumbnailHorizontalPadding 30

@implementation QTKScrollBarViewController
@synthesize slidebarThumbnailScrollView;
@synthesize slidebarSegmentedControl;
@synthesize slideBarNavView;
@synthesize slideButton;
@synthesize  slideBarTabs;
@synthesize scrollView;
@synthesize thumbNails;

- (id)init{
    return [self initWithNibName:@"QTKScrollBarViewController" bundle:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self layoutScrollView];
    [self setupSlidebarSegmentedControl];
    [self layoutSlidebar];
    
    
}


- (void)layoutScrollView{
    self.slideBarNavView.clipsToBounds = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.indicatorStyle= UIScrollViewIndicatorStyleBlack;
    //[self.scrollView setCanCancelContentTouches:NO];
    for (int i = 0; i < 7; i++){
        NSString *imageName = [NSString stringWithFormat:@"image%d.jpg", i];
		UIImage *image = [UIImage imageNamed:imageName];
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        // setup each frame to a default height and width, it will be properly placed when we call "updateScrollList"
		CGRect rect = imageView.frame;
		rect.size.height = self.scrollView.frame.size.height - 100;
		rect.size.width = 250;
		imageView.frame = rect;
		imageView.tag = i;	// tag our images for later use when we place them in serial fashion
		[self.scrollView addSubview:imageView];
    }
   
    [self layoutScrollImages];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //[self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 25)];    
}

- (void)layoutScrollImages
{
	UIImageView *view = nil;
	NSArray *subviews = [self.scrollView subviews];
    
	// reposition all image subviews in a horizontal serial fashion
	CGFloat curXLoc = 0;
   	for (view in subviews)
	{
		if ([view isKindOfClass:[UIImageView class]] && view.tag > 0 )
		{
			CGRect frame = view.frame;
			frame.origin = CGPointMake(curXLoc, 0);
			view.frame = frame;
			
			curXLoc = curXLoc + (250 + 25);
		}
	}
	
	// set the content size so it can be scrollable
	[self.scrollView setContentSize:CGSizeMake(2000, [self.scrollView bounds].size.height)];
    }

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setSlidebarSegmentedControl:nil];
    [self setSlideBarNavView:nil];
    [self setSlideButton:nil];
    [self setSlidebarThumbnailScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)setupSlidebarSegmentedControl{
    self.slideBarTabs = [NSArray arrayWithObjects:@"Seas",@"Mountains",@"Deserts",nil];
    self.slidebarSegmentedControl = [[UISegmentedControl alloc]initWithItems:self.slideBarTabs];
    self.slidebarSegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    self.slidebarSegmentedControl.hidden = NO;
    [self.slidebarSegmentedControl setFrame:CGRectMake(325,11,350,30)];
    [self.slideBarNavView addSubview:self.slidebarSegmentedControl];
    //[self.view addSubview:self.slideBarNavView];
}

- (IBAction)slideButtonTapped:(id)sender {
    if([self.slideButton.titleLabel.text isEqualToString:@"expand"]){
        [self.slideButton setTitle:@"collapse" forState:UIControlStateNormal];
        CGRect frame = self.slideBarNavView.frame;
        frame.origin.y = frame.origin.y - self.scrollView.frame.size.height;
        [self.slideBarNavView setFrame:frame];
    }
    else{
        [self.slideButton setTitle:@"expand" forState:UIControlStateNormal];
        CGRect frame = self.slideBarNavView.frame;
        frame.origin.y = frame.origin.y + self.scrollView.frame.size.height;
        [self.slideBarNavView setFrame:frame];

    }
}

- (UIImageView *)slideBarThumbnail{
    UIImageView *thumbnail = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 225, 100)];
    [thumbnail setBackgroundColor:[UIColor greenColor]];
    return thumbnail;
}

- (void)layoutSlidebar{
//    for (int i =0; i < kNoOfSlidebarThumbnails; i++){
//        UIImageView *thumbnail = [self slideBarThumbnail];
//		thumbnail.tag = i;	
//		[self.slidebarThumbnailScrollView addSubview:thumbnail];
//    }
//        
    
    
    CGPoint start = CGPointMake(15, 65);
    CGPoint currentPos = start;
   
    for(int i = 0; i < kNoOfSlidebarThumbnails; ){
        UIImageView *thumbnail = [self slideBarThumbnail];
        CGRect frame = thumbnail.frame;
        [thumbnail setFrame:CGRectMake(currentPos.x,currentPos.y,frame.size.width,frame.size.height)];
        [self.slidebarThumbnailScrollView addSubview:thumbnail];
        i++;
        if(i!=0 && i%4 == 0){
            currentPos.x = start.x ;
            currentPos.y = start.y + thumbnail.frame.size.height + kThumbnailVerticalPadding;
        }else{
          currentPos.x = currentPos.x + thumbnail.frame.size.width + kThumbnailHorizontalPadding;    
        }
        
        
    }
    
   

    
}

@end
