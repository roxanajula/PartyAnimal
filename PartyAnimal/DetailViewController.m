//
//  DetailViewController.m
//  PartyAnimal
//
//  Created by Roxana Jula on 9/25/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "DetailViewController.h"
#import "Event.h"
#import "Artist.h"
#import "Genre.h"

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
        self.navigationItem.title = _detailItem.name;
        
        //Venue name
        NSString *atVenue = [NSString stringWithFormat:@"at %@", _detailItem.venue.name];
        self.venueNameLabel.text= atVenue;
        //Flyer
        NSURL *url = [[NSURL alloc] initWithString:_detailItem.flyers[1]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [[UIImage alloc] initWithData:data];
        self.flyerImage.image = image;
        //Lineup
        NSString *artists = [[NSString alloc] init];
        for (Artist *a in _detailItem.artists) {
            artists = [artists stringByAppendingString: a.name];
            artists = [artists stringByAppendingString: @" | "];
            self.lineupText.text = artists;
        }
        //Genres
        NSString *genres = [[NSString alloc] init];
        for (Genre *g in _detailItem.genres) {
            genres = [genres stringByAppendingString: g.name];
            genres = [genres stringByAppendingString: @" | "];
            self.genresText.text = genres;
        }
        //Price
        NSString *price =[[NSString alloc] init];
        if (_detailItem.fees.kind == nil){
            price =[NSString stringWithFormat:@"%.2f %@", _detailItem.fees.price, _detailItem.fees.currency];
        } else if (_detailItem.fees.price == 0){
            price = @"Free entry";
        } else {
            price =[NSString stringWithFormat:@"%@ | %.2f %@", _detailItem.fees.kind, _detailItem.fees.price, _detailItem.fees.currency];
        }
        self.priceText.text = price;
        //Time and Date
        self.whenText.text = _detailItem.startsAtString;
        //Location
        NSString *location =[NSString stringWithFormat:@"%@, %@ \n%@, %@", _detailItem.venue.address.city,_detailItem.venue.address.country, _detailItem.venue.address.street, _detailItem.venue.address.zipCode];
        self.whereText.text = location;
       
        
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)detailTableView
{
    return 4;
}

@end
