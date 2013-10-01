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
    cell.detailTextLabel.text = event.startsAt.description;
    return cell;
}


@end


