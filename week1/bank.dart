import 'dart:io';

class Account{
  int saldo;
  Account(this.saldo);

  void checkSaldo(){
    print('\n\nSaldo Kamu di ATM adalah : \n      RP.$saldo\n\n');
  }

  void deposit(int amount){
    saldo += amount;
    print('You have successful Deposit Rp.$amount');
  }

  void withdraw(int amount){
    if(saldo < amount){
      print('\nYou not have enough saldo to withdraw\n');
      return;
    }
    saldo -= amount;
    print('You have successful Withdraw Rp.$amount\n');
  }
}
void main(){
    Account myAccount = Account(500000);
    while(true){
      menu();
      int? input = int.parse(stdin.readLineSync()!);
      switch(input){
        case 1:
          myAccount.checkSaldo();
        case 2:
          print('How much do you want to deposit?');
          int? amount = int.parse(stdin.readLineSync()!);
          if(amount <= 0) {
            print('Minimum for deposit is 1');
          }else{
            myAccount.deposit(amount);
          }
        case 3:
          print('How much do you want to withdraw?');
          int? amount = int.parse(stdin.readLineSync()!);
          if(amount <= 0) {
            print('Minimum for Withdraw is 1');
          }else{
            myAccount.withdraw(amount);
          }
        case 0:
          print('You exit CBA Line');
          exit(0);
        default:
          print('Invalid');
      }
    }
  
}

void menu(){
  print('======CBA Line======\n1.Check Saldo\n2.Deposit Saldo\n3.Tarik Saldo\n0.Exit\n====================\nInput Option Below :');
}

