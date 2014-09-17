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
@property (nonatomic) NSUInteger tentativas1;
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

- (void)setTentativas:(NSUInteger)tentativas
{
    _tentativas = tentativas;
    self.tentativasLabel.text = [NSString stringWithFormat:@"Tentativas: %d", (int)self.tentativas];
}

- (IBAction)virarCarta:(UIButton *)carta
{
    if ([carta.currentTitle isEqualToString:@""] || !carta.currentTitle) {
        
        // sorteia uma carta
        Carta *cartaSorteada = [self.baralho tirarCartaAleatoria];
        [carta setTitle:cartaSorteada.conteudo forState:UIControlStateNormal];
        
        // incrementa
        self.tentativas++;
    }
    else{
        [carta setTitle:@"" forState:UIControlStateNormal];
    }
}

@end
