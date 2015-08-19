//
//  ViewController.m
//  Music Search
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import "ViewController.h"
#import "SongDetailViewController.h"
#import "Connection.h"
#import "JSONParsing.h"
#import "ModelClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.trackNameArrayLittleCopy = [NSMutableArray array];
              self.trackNameArray = [[NSMutableArray alloc]init];
    
    NSLog(@"******************** View did load ********************");
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // NSURLConnection
    Connection * con = [[Connection alloc] init];
    con.delegate = self;
    [con downloadFile];
    [super viewDidLoad];
}

-(void) ViewWillAppear
{
    NSLog(@"The view will appear");
}

-(void)connection:(Connection *)connection didFinishWithResultData:(NSData *)xmlData
{
    // JSON Parsing
    NSLog(@"Call connection Method with JSON Parameters");
    JSONParsing * jsonParsing = [[JSONParsing alloc] initWithData:xmlData];
    jsonParsing.delegate = self;
    [jsonParsing startParsing];
    //NSLog(@"Did connection to JSON startParsing end");
}

#pragma mark - JSONParsingDelegate

//-(void) JSONParsing: (JSONParsing *)jsonParsing didFinishParsingWithResult: (NSDictionary *) resultDict
-(void) JSONParsing: (JSONParsing *)jsonParsing didFinishParsingWithResult: (NSMutableArray*) resultDict
{
    NSLog(@"JSON Parsing -> ");
    //NSLog(@"%@", resultDict);
    
    NSDictionary * dictionaryFromParse = resultDict;

    NSArray * artistArray = [[dictionaryFromParse allValues] objectAtIndex:0];
    //NSLog(@"Array -> %@", artistArray);
    NSLog(@"Elements from Dictionary -> %lu", [artistArray count]);
    
    for (NSDictionary * songInfo in artistArray)
    {
         NSString * track = [songInfo objectForKey:@"trackName"];
        NSString * artist = [songInfo objectForKey:@"artistName"];
         NSString * album = [songInfo objectForKey:@"collectionName"];
        NSString * urlArt = [songInfo objectForKey:@"artworkUrl100"];
        
        ModelClass * newElement=[[ModelClass alloc]init];
          newElement.songName = track;
        newElement.artistName = artist;
         newElement.albumName = album;
        newElement.urlArtWork = urlArt;
        
        //NSLog(@"New.element form ModerClass.songName %@", newElement.songName);
        
        [self.trackNameArray addObject:newElement];
    }
    //NSLog(@"trackNameArray%@", [self trackNameArray]);
    ModelClass * testing = (ModelClass *)[self.trackNameArray objectAtIndex:0];
    //NSLog(@" testing.songName; %@",testing.songName);
    self.trackNameArrayLittleCopy = self.trackNameArray;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Table view return array count");
    NSLog(@"Array Size -> %lu", (unsigned long)[self.trackNameArray count]);
    
    //NSLog(@"%@", [ModelClass.songName.length]);
   // return [setDataToModel.songName.length];
    //NSLog(@"%@", self.trackNameArray);
    return [self.trackNameArray count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"Goes inside of the tableview");
    
    //NSLog(@"This is the table view method");
    static NSString * simpleTableIdentifier = @"SongCell";
    //NSLog(@"self.trackNameArrayLittleCopy.........%@", self.trackNameArrayLittleCopy);
    ModelClass *track = (ModelClass *)[self.trackNameArrayLittleCopy objectAtIndex:indexPath.row];
    //NSLog(@" testing.songName.........; %@",track.songName);

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
//  ModelClass* track=[self.trackNameArray objectAtIndex:indexPath.row];
//  cell.textLabel.text = [trackNameArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",track.songName,track.artistName];
    
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"This is the method for the Song Detailed");
   // UITableViewCell* cell=(UITableViewCell*)
    
    if ([segue.identifier isEqualToString:@"ShowSongDetail"])
    {
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        ModelClass* element=[self.trackNameArray objectAtIndex:indexPath.row];
        
        SongDetailViewController * songDetailViewController = segue.destinationViewController;
        songDetailViewController.songInformation=element;
       
        NSLog(@"Current Song -> %@",element.songName );
    }
   
}

- (IBAction)actionSearchButton:(UIButton *)sender
{
    NSLog(@"Button Search Pressed");
    
    self.trackNameArray = [[NSMutableArray alloc]init];
    
    NSString * textFieldSeach = self.textAreaSeachField.text;
    
    NSLog(@"%@", textFieldSeach);
    
    Connection * con = [[Connection alloc] init];
    con.delegate = self;
    [con downloadFileSearch:textFieldSeach];
    
    NSLog(@"Search Results after the connection and parse");
    
    [super viewDidLoad];
    [self.tableView reloadData];
    
}

@end
