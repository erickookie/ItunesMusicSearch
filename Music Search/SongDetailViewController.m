//
//  SongDetailViewController.m
//  Music Search
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import "SongDetailViewController.h"


@implementation SongDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ModelClass * songDetails = [[ModelClass alloc] init];
    
    NSLog(@"It entered the Second view");
    
    //Set the Label text to the selected recipe
      _songLabel.text = self.songInformation.songName;
    _artistLabel.text = self.songInformation.artistName;
     _albumLabel.text = self.songInformation.albumName;
       _urlLabel.text = self.songInformation.urlArtWork;

    NSLog(@"Song Name -> %@", self.songInformation.songName);
    NSLog(@"Artis Name -> %@", self.songInformation.artistName);
    
    NSString * songNameWithOutSpaces = [self.songInformation.songName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSLog(@"Song Name with out spaces -> %@", songNameWithOutSpaces);
    
    NSString * artistNameWithOutSpaces = [self.songInformation.artistName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSLog(@"Artist Name with out spaces -> %@", artistNameWithOutSpaces);
    
    
    
    NSString * songPLUSname = [NSString stringWithFormat:@"%@:%@",artistNameWithOutSpaces,songNameWithOutSpaces];
    NSLog(@"artist PLUS song -> %@", songPLUSname);
    
    NSString * lyricsURL = [NSString stringWithFormat:@"http://lyrics.wikia.com/wiki/%@", songPLUSname];
    NSLog(@"Full URL for web view -> %@", lyricsURL);
    
    NSString * urlArtWork = self.songInformation.urlArtWork;

    NSURL * url = [NSURL URLWithString:urlArtWork];
    NSURL * url2 = [NSURL URLWithString:lyricsURL];
    NSLog(@"%@", url);
    
    //NSURL * imageURL = [NSURL URLWithString:@"http://192.168.1.2x0/pic/LC.jpg"];
    NSData * imageData = [NSData dataWithContentsOfURL:url];
    self.urlWebImageView.image=[[UIImage alloc]initWithData:imageData];
    
    //[subview setImage:[UIImage imageWithData:imageData]];
    
    //[self.urlWebView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.urlLyricsWebView loadRequest:[NSURLRequest requestWithURL:url2]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
