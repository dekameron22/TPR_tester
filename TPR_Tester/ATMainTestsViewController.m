//
//  ATMainTestsViewController.m
//  TPR_Tester
//
//  Created by Artem Tkachuk on 16.06.14.
//  Copyright (c) 2014 Artem Tkachuk. All rights reserved.
//

#import "ATMainTestsViewController.h"
#import "ATMainQuestionTableViewCell.h"
#import "ATAnswersTableViewCell.h"

@interface ATMainTestsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (strong, nonatomic) NSString *currentQuestion;
@property (strong, nonatomic) NSString *currentAnswer;

@property (strong, nonatomic) NSMutableArray *answers;

@property (strong, nonatomic) NSMutableDictionary *questionsToAnswersDictionary;

@property (strong, nonatomic) NSMutableArray *questionsArray;

@property (strong, nonatomic) NSMutableDictionary *correctAnswers;

@property NSInteger currentQuestionIndex;

@property (strong, nonatomic) NSMutableArray *checked;

@property (strong, nonatomic) NSMutableDictionary *userAnswers;


- (IBAction)previousButtonClicked:(id)sender;
- (IBAction)nextButtonClicked:(id)sender;


@end

@implementation ATMainTestsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.answers = [[NSMutableArray alloc] init];
    self.questionsToAnswersDictionary = [[NSMutableDictionary alloc] init];
    self.questionsArray = [[NSMutableArray alloc] init];
    self.checked = [[NSMutableArray alloc] init];
    self.userAnswers = [[NSMutableDictionary alloc] init];
    self.correctAnswers = [[NSMutableDictionary alloc] init];
    self.currentQuestionIndex = 0;
    
    [self fillQuestionsAndAnswersArray];
    
}

#pragma mark - encodeFromUTF8
-(NSString *) encodeBackToCharacter:(NSString *) stringToConvert
{
    NSString *result = [NSString
                        stringWithCString:[stringToConvert cStringUsingEncoding:NSUTF8StringEncoding]
                        encoding:NSNonLossyASCIIStringEncoding];
    
    return result;
}

#pragma mark - fill array of questions
-(void) fillQuestionsAndAnswersArray
{
    [self.questionsArray addObject:@"Кубкова система, що використовується у багатьох видах спорту є застосуванням правила"];
    
    [self.answers addObject:[NSString stringWithFormat:@"Копленда"]];
    [self.answers addObject:@"Борда"];
    [self.answers addObject:@"послідовного виключення"];
    [self.answers addObject:@"паралельного виключення"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"0"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Відображення голосування базується на правилі підрахунку балів тоді й лише тоді, коли задовольняє наступним чотирьом аксіомам: анонімності, поповнення, неперервності та..."];
    
    [self.answers addObject:@"нейтральності "];
    [self.answers addObject:@"участі"];
    [self.answers addObject:@"ефективності"];
    [self.answers addObject:@"незалежності"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"1"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Виберіть правильне твердження:"];
    
    [self.answers addObject:@"Правило Сімпсона відповідає егалітарному, а правило Копленда — утилітарному критерію вибору"];
    [self.answers addObject:@"Правило Сімпсона відповідає утилітарному, а правило Копленда — егалітарному критерію вибору "];
    [self.answers addObject:@"Правила Копленда і Сімпсона відповідають утилітарному критерію вибору"];
    [self.answers addObject:@"Правила Копленда і Сімпсона відповідають егалітарному критерію вибору "];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"2"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Виберіть невірне твердження:"];
    
    [self.answers addObject:@"правило Сімпсона задовольняє аксіомі поповнення "];
    [self.answers addObject:@"правило Борда задовольняє аксіомі монотонності"];
    [self.answers addObject:@"правило Копленда не задовольняє аксіомі монотонності "];
    [self.answers addObject:@"правило Кондорсе не задовольняє аксіомі поповнення"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"3"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Якщо при виборі переможця за правилом Кондорсе немає кандидата, що перемагає усіх інших, то..."];
    
    [self.answers addObject:@"переможця не існує"];
    [self.answers addObject:@"перемагає той, що має більше перемог у попарних порівняннях "];
    [self.answers addObject:@"переможець вибирається “головою жюрі” "];
    [self.answers addObject:@"переможець обирається випадковим чином"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"4"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"До предмету теорії прийняття рішень відносяться задачі"];
    
    [self.answers addObject:@"сильно структуровані "];
    [self.answers addObject:@"слабо структуровані "];
    [self.answers addObject:@"неструктуровані"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"5"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Функція вибору C, задана на Ω, відображення, що зіставляє кожній підмножині X ⊆ Ω"];
    
    [self.answers addObject:@"підмножину найкращих елементів "];
    [self.answers addObject:@"один найкращий елемент "];
    [self.answers addObject:@"бінарне відношення, що структурує підмножину "];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"6"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Які типи залежності між альтернативами та наслідками Ви знаєте?"];
    
    [self.answers addObject:@"детермінована "];
    [self.answers addObject:@"недетермінована"];
    [self.answers addObject:@"зворотня"];
    [self.answers addObject:@"нечітка"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"7"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Нехай (~R) - доповнення до бінарного відношення R. Якщо з x(R)y випливає y(~R)x, то таке відношення R називається"];
    
    [self.answers addObject:@"асиметричне"];
    [self.answers addObject:@"антисиметричне"];
    [self.answers addObject:@"антирефлексивне"];
    [self.answers addObject:@"ациклічним"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"8"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Які з вказаних тверджень невірні?"];
    
    [self.answers addObject:@"Переможець за правилом Кондорсе(якщо він існує) завжди переможе за правилом Сімпсона."];
    [self.answers addObject:@"Переможець за правилом Кондорсе(якщо він існує) завжди переможе за правилом Копленда.Переможець за правилом Кондорсе(якщо він існує) завжди переможе за правилом Копленда."];
    [self.answers addObject:@"Переможець за правилом Сімпсона завжди переможе за правилом Копленда. "];
    [self.answers addObject:@"Переможець за правилом Копленда завжди переможе за правилом Сімпсона"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"9"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"На які основні групи поділяють методи обробки експертної інформації?"];
    
    [self.answers addObject:@"алгебраїчні, геометричні, аналітичні, практичні"];
    [self.answers addObject:@"статичні, алгебраїчні, ранжування"];
    [self.answers addObject:@"статистичні, геометричні, алгебраїчні, шкалювання "];
    [self.answers addObject:@"статистичні, алгебраїчні, шкалювання "];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"10"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"У задачах прийняття індивідуальних та групових рішень, за своїм характером критерії поділяються на"];
    
    [self.answers addObject:@"ординальні та номінальні"];
    [self.answers addObject:@" кількісні та якісні"];
    [self.answers addObject:@"одиничні та множинні "];
    [self.answers addObject:@"статистичні та практичні"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"11"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Що спільного між методом ідеальної точки та методом вибору за кількістю домінуючих критеріїв?"];
    
    [self.answers addObject:@"методи призначені для розв'язку багатокритеріальних задач із дискретною множиною альтернатив, яка має невелику потужність (може бути перебрана за реальний час) "];
    [self.answers addObject:@"послідовне (на кожному кроці) введення обмежень на альтернативи, які мають незадовільні, із погляду ОПР, значення критеріїв "];
    [self.answers addObject:@"не використовує допоміжну інформацію від ОПР про перевагу на множині критеріїв "];
    [self.answers addObject:@"на нульовому кроці розраховуються найкращі та найгірші значення критеріїв"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"12"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Яке із запропонованих тверджень є особливістю методу задоволення вимог"];
    
    [self.answers addObject:@"визначення переваги на множині критеріїв шляхом виділення так званого головного критерію"];
    [self.answers addObject:@"необхідність задання ОПР бажаних значень критеріїв для визначення переваги на множині критеріїв"];
    [self.answers addObject:@"послідовне (на кожному кроці) введення обмежень на альтернативи, які мають незадовільні, із погляду ОПР, значення критеріїв "];
    [self.answers addObject:@"не використовує допоміжну інформацію від ОПР про перевагу на множині критеріїв"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"13"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Яка діалогова процедура, призначена для пошуку ефективних альтернатив у задачах багатокритеріальної безумовної оптимізації такого вигляду: max(f[i](x)), xєR^n, i=(1,m)?"];
    
    [self.answers addObject:@"метод задоволення вимог"];
    [self.answers addObject:@"метод векторної релаксації"];
    [self.answers addObject:@"методом ідеальної точки"];
    [self.answers addObject:@"метод послідовного вводу обмежень"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"14"];
    self.answers = [[NSMutableArray alloc] init];
    
    [self.questionsArray addObject:@"Згідно з сіткою Томаса-Кілмана, якій ситації відповідає такий стиль дій: -вас не дуже хвилює конфлікт; -ви хочете зберегти мир; -ви розумієте, що не праві; -у вас мало шансів перемогти; -ви розумієте, що вирішити конфлікт на свою користь набагато важливіше для іншої сторони."];
    
    [self.answers addObject:@"конкуренція"];
    [self.answers addObject:@"пристосування"];
    [self.answers addObject:@"ухилення"];
    [self.answers addObject:@"співпраця"];
    
    [self.questionsToAnswersDictionary setObject:self.answers forKey:@"15"];
    self.answers = [[NSMutableArray alloc] init];
    
    for (NSInteger currentIndex = 0; currentIndex < [self.questionsToAnswersDictionary count]; currentIndex++)
    {
        [self.correctAnswers setObject:[NSString stringWithFormat:@"%i", currentIndex%3 + 1] forKey:[NSString stringWithFormat:@"%i", currentIndex]];
        [self.checked addObject:[NSNumber numberWithBool:NO]];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.questionsToAnswersDictionary objectForKey:[NSString stringWithFormat:@"%i", self.currentQuestionIndex]] count] + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        static NSString *cellIdentifire = @"questionCell";
        ATMainQuestionTableViewCell *resultCellMainQuestion;
        
        resultCellMainQuestion = [tableView dequeueReusableCellWithIdentifier:cellIdentifire forIndexPath:indexPath];
        
        self.currentQuestion = [self.questionsArray objectAtIndex:self.currentQuestionIndex];
        
        [resultCellMainQuestion.questionLabel setText:self.currentQuestion];
        
        if ([[self.checked objectAtIndex:indexPath.row] boolValue] == YES)
        {
            [resultCellMainQuestion.answered setText:@"Allready answered"];
            
            [resultCellMainQuestion setBackgroundColor:[UIColor grayColor]];
        }
        else
        {
            [resultCellMainQuestion.answered setText:@""];
        }
        
        return resultCellMainQuestion;
        
    }
    else
    {
        static NSString *cellIdentifire = @"answerCell";
        ATAnswersTableViewCell *resultCellAnswer;
        
        resultCellAnswer = [tableView dequeueReusableCellWithIdentifier:cellIdentifire forIndexPath:indexPath];
        
        NSString *indexQuestionString = [NSString stringWithFormat:@"%i", self.currentQuestionIndex];
        
        self.currentAnswer = [[self.questionsToAnswersDictionary valueForKey:indexQuestionString] objectAtIndex:indexPath.row - 1];
        
        [resultCellAnswer.answerLabel setText:self.currentAnswer];
        
        return resultCellAnswer;
        
    }
    
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return;
    }
    
    if (self.currentQuestionIndex == [self.questionsToAnswersDictionary count] - 1)
    {
        
    }
    else
    {
        self.currentQuestionIndex++;
        
        [self.userAnswers setObject:[NSString stringWithFormat:@"%i", indexPath.row] forKey:[NSString stringWithFormat:@"%i", self.currentQuestionIndex]];
    
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 200;
    }
    else return 60;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)previousButtonClicked:(id)sender
{
    if (self.currentQuestionIndex > 0)
    {
        self.currentQuestionIndex--;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)nextButtonClicked:(id)sender
{
    if (self.currentQuestionIndex < [self.questionsToAnswersDictionary count] - 1)
    {
        self.currentQuestionIndex++;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    }
}
@end
