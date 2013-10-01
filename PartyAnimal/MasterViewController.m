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
    
    NSString *dateString = event.startsAt.description;
    NSArray *dateParts = [dateString componentsSeparatedByString: @" "];
    NSString *date = [dateParts objectAtIndex: 0];
    NSString *time = [dateParts objectAtIndex: 1];
    NSArray *timeParts = [time componentsSeparatedByString: @":"];
    NSString *hour = [timeParts objectAtIndex:0];
    NSString *minutes = [timeParts objectAtIndex:1];
    NSString *eventStartsAt = [NSString stringWithFormat:@"%@:%@     %@", hour,minutes, date];
    cell.detailTextLabel.text = eventStartsAt;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailController =segue.destinationViewController;
    Event *event = [self.masterEvents objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = event;
}
@end




