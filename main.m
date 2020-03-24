//
//  main.m
//  Lab1
//
//  Created by Diego Espinosa on 2020-03-23.
//  Copyright © 2020 Diego Espinosa. All rights reserved.
//

#import <Foundation/Foundation.h>

NSMutableString *getUserInput(int maxLenght, NSMutableString *prompt){
    if (maxLenght < 1){
        maxLenght = 255;
    }
    
    NSLog(@"%@", prompt);
    char inputChars[maxLenght];
    char *result = fgets(inputChars, maxLenght, stdin);
    if(result != NULL){
        return [[NSMutableString stringWithUTF8String:inputChars]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return NULL;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES){
            NSMutableString *strInput = getUserInput(255, @"\n Enter your String: ('q' to quit)");
            if ([strInput isEqualToString:@"q"]){break;}
            while (YES){
                NSMutableString *option = getUserInput(10, @"\n Choose one of the folloowing options:\n1. Uppercase\n2. Lowercase\n3. Numerize\n4. Canadianize\n5. Respond\n6. De-Space-It\n7. Word Count\n8. Remove Punctuations\n9. Done\n");
                if([option isEqualToString:@"9"]){break;}
                else if([option isEqualToString:@"1"]){
                    NSLog(@"%@ ", [strInput uppercaseString]);
                }else if([option isEqualToString:@"2"]){
                    NSLog(@"%@ ", [strInput lowercaseString]);
                }else if([option isEqualToString:@"3"]){
                    //check if strInput is number?
                    //NSNumberFormatter formatter = new NSNumberFormatter(); (JAVA)
                    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
                    NSNumber *number = [formatter numberFromString: strInput];
                    if (number != nil){
                        NSLog(@"%ld", [number integerValue]);
                        // %ld = LongDecimal
                    }else{
                        NSLog(@"%@", @"Input Cannot Be Converted to Integer");
                    }}else if([option isEqualToString:@"4"]){
                        NSLog(@"%@", [strInput stringByAppendingString:@", eh?"]);
                    }else if([option isEqualToString:@"5"]){
                        if([strInput characterAtIndex:[strInput length] -1] == '?'){
                            NSLog(@"%@", @"I dont know ");
                        }else if ([strInput characterAtIndex:[strInput length] -1] == '!'){
                            NSLog(@"%@", @"Whoa Calm Down! ");
                        }
                    } else if ([option isEqualToString:@"6"]){
                        NSLog(@"%@", [strInput stringByReplacingOccurrencesOfString:@" " withString:@"-"]);
                    }else if([option isEqualToString:@"7"]){
                        int place = 0;
                        int count = 1;
                        while(place < strInput.length){
                            if([strInput characterAtIndex:place] == ' '){
                                count += 1;
                                place += 1;
                            }else { place += 1;}
                        }
                        NSLog(@"%i", count);
                    }else if([option isEqualToString:@"8"]){
                        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"] invertedSet];
                        NSMutableString *ans = [[strInput componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                        NSLog (@"%@", ans);
                    }
            }
        }
    }
    return 0;
}
