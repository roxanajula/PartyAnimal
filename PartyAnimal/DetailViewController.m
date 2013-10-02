//
//  DetailViewController.m
//  PartyAnimal
//
//  Created by Roxana Jula on 9/25/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "DetailViewController.h"
#import "Event.h"

@interface DetailViewController ()
-(void)configureView;
@end

@implementation DetailViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    //Set up initial UI state
    if (self.detailItem) {
        self.eventNameLabel.text= _detailItem.name;
        self.navigationItem.title = _detailItem.name;
        NSString *atVenue = [NSString stringWithFormat:@"at %@", _detailItem.venue.name];
        self.venueNameLabel.text= atVenue;
        NSURL *url = [[NSURL alloc] initWithString:_detailItem.flyers[1]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc] initWithData:data];
        self.flyerImage.image = image;
        self.navigationItem.title = _detailItem.name;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
