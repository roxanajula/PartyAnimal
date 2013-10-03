//
//  MasterViewController.m
//  PartyAnimal
//
//  Created by Roxana Jula on 9/25/13.
//  Copyright (c) 2013 RubyTribe. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "DataRetriever.h"
#import "Event.h"
#import "Factory.h"

@interface MasterViewController(){
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [DataRetriever retrieveData:^(NSArray *events) {
        self.masterEvents= events;
        [self.tableView reloadData];
    }];

    self.currentLocation = [Factory createReferenceLocation];
    //NSLog (@"Latitude: %f", self.currentLocation.coordinate.latitude);
    //NSLog (@"Longitude: %f", self.currentLocation.coordinate.longitude);

}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _masterEvents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"EventCell"];
    Event *event =[self.masterEvents objectAtIndex:indexPath.row];
    cell.textLabel.text = event.name;
    
    NSURL *url = [[NSURL alloc] initWithString:event.flyers[0]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc] initWithData:data];
    cell.imageView.image=image;
    //Starts at
    cell.detailTextLabel.text = event.startsAtString;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailController =segue.destinationViewController;
    Event *event = [self.masterEvents objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = event;
}
@end




