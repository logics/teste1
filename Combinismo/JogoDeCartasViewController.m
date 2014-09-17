//
//  JogoDeCartasViewController.m
//  Combinismo
//
//  Created by Swift Dojo on 06/09/14.
//  Copyright (c) 2014 CocoaHeads Goiania. All rights reserved.
//

#import "JogoDeCartasViewController.h"
#import "BaralhoDeJogo.h"

@interface JogoDeCartasViewController ()

// Model
@property (nonatomic) NSUInteger tentativas2;
@property (strong, nonatomic) Baralho *baralho;

// View
@property (weak, nonatomic) IBOutlet UILabel *tentativasLabel;

@end

@implementation JogoDeCartasViewController

- (Baralho *)baralho
{
    if (!_baralho) _baralho = [[BaralhoDeJogo alloc] init];
    
    return _baralho;
}

- (void)setTentativas2:(NSUInteger)tentativas2
{
    _tentativas2 = tentativas2;
    self.tentativasLabel.text = [NSString stringWithFormat:@"Tentativas: %d", (int)self.tentativas2];
}

- (IBAction)virarCarta:(UIButton *)carta
{
    if ([carta.currentTitle isEqualToString:@""] || !carta.currentTitle) {
        
        // sorteia uma carta
        Carta *cartaSorteada = [self.baralho tirarCartaAleatoria];
        [carta setTitle:cartaSorteada.conteudo forState:UIControlStateNormal];
        
        // incrementa
        self.tentativas2++;
    }
    else{
        [carta setTitle:@"" forState:UIControlStateNormal];
    }
}

@end
