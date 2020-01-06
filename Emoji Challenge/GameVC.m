//
//  GameVC.m
//  Emoji Challenge
//
//  Created by Macbook on 19/08/2019.
//  Copyright © 2019 TP. All rights reserved.
//

#import "GameVC.h"

@interface GameVC ()
{
    NSMutableArray * dataArray;
    NSMutableDictionary * data;
    
    NSMutableDictionary * SelectedItem;
    
    NSString * target;
    
    NSString * answerString;
    
    
    int n1;
    int n2;
    int n3;
    
    
    int targetNumber;
    int sum;
    int attempts;
    int buttonCount;
    
    int randomButton;
    int index;
    int score;
    int count;
    
    NSTimer * t;
    int timer;
}

@end

@implementation GameVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.hidden = false;
    
    
    [self setArray];
    
    sum = 0;
    buttonCount = 1;
    
    index = 0;
    score = 0;
    count = 0;
    attempts = 3;
    
    [self setScreen];
}


- (IBAction)b1:(id)sender
{
    if ([_b1.titleLabel.text isEqualToString:answerString])
    {
        score = score + 10;
        [self setScreen];
    }
    else
    {
        [self showFailAlertFinal];
    }
}

- (IBAction)b2:(id)sender
{
    if ([_b2.titleLabel.text isEqualToString:answerString])
    {
        score = score + 10;
        [self setScreen];
    }
    else
    {
        [self showFailAlertFinal];
    }
}

- (IBAction)b3:(id)sender
{
    if ([_b3.titleLabel.text isEqualToString:answerString])
    {
        score = score + 10;
        [self setScreen];
    }
    else
    {
        [self showFailAlertFinal];
    }
}

- (IBAction)b4:(id)sender
{
    if ([_b4.titleLabel.text isEqualToString:answerString])
    {
        score = score + 10;
        [self setScreen];
    }
    else
    {
        [self showFailAlertFinal];
    }
}

- (IBAction)skip:(id)sender
{
    [self setScreen];
}



-(void) setScreen
{
    
    if (count == 10)
    {
        if (score == 100)
        {
            [self showPassedAlertFinal];
            _pointsLabel.text = [NSString stringWithFormat:@"%d", score];
        }
        else
        {
            [self showFailAlertFinal];
            _pointsLabel.text = [NSString stringWithFormat:@"%d", score];
        }
    }
    else
    {
        sum = 0;
        count = count + 1;
        
        buttonCount = 1;
        answerString = @"";
        
        int rand = arc4random()%dataArray.count;
        
        SelectedItem = [dataArray objectAtIndex:rand];
        
      //  targetNumber = [[SelectedItem objectForKey:@"target"] intValue];
        
        _emojiImageView.image = [UIImage imageNamed:[SelectedItem objectForKey:@"emoji"]];
        
        [_b1 setTitle:[SelectedItem objectForKey:@"b1"] forState:UIControlStateNormal];
        [_b2 setTitle:[SelectedItem objectForKey:@"b2"] forState:UIControlStateNormal];
        [_b3 setTitle:[SelectedItem objectForKey:@"b3"] forState:UIControlStateNormal];
        [_b4 setTitle:[SelectedItem objectForKey:@"b4"] forState:UIControlStateNormal];
        
        answerString = [SelectedItem objectForKey:@"answer"];
        
        
        _levelLabel.text = [NSString stringWithFormat:@"Level - %d", count];
        
     
        
        _pointsLabel.text = [NSString stringWithFormat:@"%d", score];
        
        
    }
    
    
}




-(void) setArray
{
    dataArray = [[NSMutableArray alloc] init];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"amazed.png" forKey:@"emoji"];
    [data setValue:@"Wow" forKey:@"b1"];
    [data setValue:@"Amazed" forKey:@"b2"];
    [data setValue:@"Angry" forKey:@"b3"];
    [data setValue:@"Blush" forKey:@"b4"];
    [data setValue:@"Amazed" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"shocked.png" forKey:@"emoji"];
    [data setValue:@"Angry" forKey:@"b1"];
    [data setValue:@"Amazed" forKey:@"b2"];
    [data setValue:@"Shocked" forKey:@"b3"];
    [data setValue:@"Blush" forKey:@"b4"];
    [data setValue:@"Shocked" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"Devil.png" forKey:@"emoji"];
    [data setValue:@"Horn" forKey:@"b1"];
    [data setValue:@"Amazed" forKey:@"b2"];
    [data setValue:@"Devil" forKey:@"b3"];
    [data setValue:@"Blush" forKey:@"b4"];
    [data setValue:@"Devil" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"angry.png" forKey:@"emoji"];
    [data setValue:@"Angry" forKey:@"b1"];
    [data setValue:@"Amazed" forKey:@"b2"];
    [data setValue:@"Red" forKey:@"b3"];
    [data setValue:@"Blush" forKey:@"b4"];
    [data setValue:@"Angry" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"Bless.png" forKey:@"emoji"];
    [data setValue:@"Bless" forKey:@"b1"];
    [data setValue:@"Amazed" forKey:@"b2"];
    [data setValue:@"Hug" forKey:@"b3"];
    [data setValue:@"Blush" forKey:@"b4"];
    [data setValue:@"Bless" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"Heart.png" forKey:@"emoji"];
    [data setValue:@"Kiss" forKey:@"b1"];
    [data setValue:@"Heart" forKey:@"b2"];
    [data setValue:@"Love" forKey:@"b3"];
    [data setValue:@"Blush" forKey:@"b4"];
    [data setValue:@"Heart" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"Wink.png" forKey:@"emoji"];
    [data setValue:@"Wink" forKey:@"b1"];
    [data setValue:@"Amazed" forKey:@"b2"];
    [data setValue:@"Blind" forKey:@"b3"];
    [data setValue:@"Bless" forKey:@"b4"];
    [data setValue:@"Wink" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"blush.png" forKey:@"emoji"];
    [data setValue:@"Wow" forKey:@"b1"];
    [data setValue:@"Amazed" forKey:@"b2"];
    [data setValue:@"Hug" forKey:@"b3"];
    [data setValue:@"Blush" forKey:@"b4"];
    [data setValue:@"Blush" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"boss.png" forKey:@"emoji"];
    [data setValue:@"Wow" forKey:@"b1"];
    [data setValue:@"Cool" forKey:@"b2"];
    [data setValue:@"Angry" forKey:@"b3"];
    [data setValue:@"Spectacles" forKey:@"b4"];
    [data setValue:@"Cool" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"cry.png" forKey:@"emoji"];
    [data setValue:@"Wow" forKey:@"b1"];
    [data setValue:@"Cry" forKey:@"b2"];
    [data setValue:@"Love" forKey:@"b3"];
    [data setValue:@"Weep" forKey:@"b4"];
    [data setValue:@"Weep" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"crying.png" forKey:@"emoji"];
    [data setValue:@"Cry" forKey:@"b1"];
    [data setValue:@"Hug" forKey:@"b2"];
    [data setValue:@"Angry" forKey:@"b3"];
    [data setValue:@"Spectacles" forKey:@"b4"];
    [data setValue:@"Cry" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"kiss.png" forKey:@"emoji"];
    [data setValue:@"Kiss" forKey:@"b1"];
    [data setValue:@"Sad" forKey:@"b2"];
    [data setValue:@"Hug" forKey:@"b3"];
    [data setValue:@"Love" forKey:@"b4"];
    [data setValue:@"Kiss" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"laugh.png" forKey:@"emoji"];
    [data setValue:@"Laugh" forKey:@"b1"];
    [data setValue:@"Hug" forKey:@"b2"];
    [data setValue:@"Smile" forKey:@"b3"];
    [data setValue:@"Teeth" forKey:@"b4"];
    [data setValue:@"Laugh" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"love.png" forKey:@"emoji"];
    [data setValue:@"Heart" forKey:@"b1"];
    [data setValue:@"Kiss" forKey:@"b2"];
    [data setValue:@"Love" forKey:@"b3"];
    [data setValue:@"Hug" forKey:@"b4"];
    [data setValue:@"Love" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"sad.png" forKey:@"emoji"];
    [data setValue:@"Cry" forKey:@"b1"];
    [data setValue:@"Sad" forKey:@"b2"];
    [data setValue:@"Smile" forKey:@"b3"];
    [data setValue:@"Tear" forKey:@"b4"];
    [data setValue:@"Sad" forKey:@"answer"];
    [dataArray addObject:data];
    
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"smile.png" forKey:@"emoji"];
    [data setValue:@"Smile" forKey:@"b1"];
    [data setValue:@"Hug" forKey:@"b2"];
    [data setValue:@"Love" forKey:@"b3"];
    [data setValue:@"Angry" forKey:@"b4"];
    [data setValue:@"Smile" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"fear.png" forKey:@"emoji"];
    [data setValue:@"Smile" forKey:@"b1"];
    [data setValue:@"Fear" forKey:@"b2"];
    [data setValue:@"Cry" forKey:@"b3"];
    [data setValue:@"Angry" forKey:@"b4"];
    [data setValue:@"Fear" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"expless.png" forKey:@"emoji"];
    [data setValue:@"Smile" forKey:@"b1"];
    [data setValue:@"No Express" forKey:@"b2"];
    [data setValue:@"Fear" forKey:@"b3"];
    [data setValue:@"Angry" forKey:@"b4"];
    [data setValue:@"No Express" forKey:@"answer"];
    [dataArray addObject:data];
    
    data = [[NSMutableDictionary alloc] init];
    [data setValue:@"wow.png" forKey:@"emoji"];
    [data setValue:@"Smile" forKey:@"b1"];
    [data setValue:@"Dizzy" forKey:@"b2"];
    [data setValue:@"Love" forKey:@"b3"];
    [data setValue:@"Angry" forKey:@"b4"];
    [data setValue:@"Dizzy" forKey:@"answer"];
    [dataArray addObject:data];
}




-(void) showFailAlert
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Lost"
                                                                   message:[NSString stringWithFormat:@"You failed to guess the Emojis"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) showFailAlertFinal
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Lost"
                                                                   message:[NSString stringWithFormat:@"You have failed. Your score is %d", score]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showFailAlertAttempt
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Lost"
                                                                   message:[NSString stringWithFormat:@"You failed to guess the emoji"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self setScreen];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showPassedAlert
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Congratulations"
                                                                   message:[NSString stringWithFormat:@"you guessed correct"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Next" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self setScreen];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void) showPassedAlertFinal
{
    [t invalidate];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"You Won"
                                                                   message:[NSString stringWithFormat:@"Congratulations. You Scored : %d", score]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              [self.navigationController popViewControllerAnimated:YES];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
