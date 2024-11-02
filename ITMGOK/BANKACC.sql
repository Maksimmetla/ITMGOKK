CREATE TABLE users(
userID SERIAL PRIMARY KEY,
first_name VARCHAR(255),
last_name VARCHAR(255),
date_of_bith DATE,
phone_number INT 
); 

CREATE TABLE account(
accountID SERIAL PRIMARY KEY,
userID INT,
from_card_to_cardID INT UNIQUE,
transfers_to_usersID INT UNIQUE,
card1ID INT UNIQUE,
card2ID INT UNIQUE,
card3ID INT UNIQUE,
credit_cardID INT UNIQUE,
savingsID INT UNIQUE,
history_of_operationsID INT UNIQUE,
FOREIGN KEY (userID) REFERENCES users(userID)
);

CREATE TABLE from_card_to_card(
from_card_to_cardID SERIAL PRIMARY KEY,
transfer_amount DOUBLE PRECISION,
date_amount DATE,
cardID INT UNIQUE,
FOREIGN KEY (from_card_to_cardID) REFERENCES account(from_card_to_cardID)
);

CREATE TABLE transfers_to_users(
transfers_to_usersID SERIAL PRIMARY KEY,
transfer_amount DOUBLE PRECISION,
date_amount DATE,
userID INT UNIQUE,
FOREIGN KEY (transfers_to_usersID) REFERENCES account(transfers_to_usersID)
);

CREATE TABLE card1(
card1ID SERIAL PRIMARY KEY,
card_number INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
opening_date DATE,
balance DOUBLE PRECISION,
FOREIGN KEY (card1ID) REFERENCES account(card1ID)
);

CREATE TABLE card2(
card2ID SERIAL PRIMARY KEY,
card_number INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
opening_date DATE,
balance DOUBLE PRECISION,
FOREIGN KEY (card2ID) REFERENCES account(card2ID)
);

CREATE TABLE card3(
card3ID SERIAL PRIMARY KEY,
card_number INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
opening_date DATE,
balance DOUBLE PRECISION,
FOREIGN KEY (card3ID) REFERENCES account(card3ID)
);

CREATE TABLE credit_card(
credit_cardID SERIAL PRIMARY KEY,
card_number INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
opening_date DATE,
balance DOUBLE PRECISION,
FOREIGN KEY (credit_cardID) REFERENCES account(credit_cardID )
);

CREATE TABLE savings( 
savingsID SERIAL PRIMARY KEY,
bank_account1ID INT UNIQUE,
bank_account2ID INT UNIQUE,
currency_rateID INT UNIQUE,
creditID INT UNIQUE,
portfolioID INT UNIQUE,
FOREIGN KEY (savingsID) REFERENCES account(savingsID)
);

CREATE TABLE bank_account1(
bank_account1ID SERIAL PRIMARY KEY,
balance DOUBLE PRECISION,
opening_date DATE,
closing_date DATE,
percent_rate DOUBLE PRECISION,
FOREIGN KEY (bank_account1ID) REFERENCES savings(bank_account1ID )
);

CREATE TABLE bank_account2(
bank_account2ID SERIAL PRIMARY KEY,
balance DOUBLE PRECISION,
opening_date DATE,
closing_date DATE,
percent_rate DOUBLE PRECISION,
FOREIGN KEY (bank_account2ID) REFERENCES savings(bank_account2ID )
);

CREATE TABLE currency_rate(
currency_rateID SERIAL PRIMARY KEY,
currency_name VARCHAR(255),
buying_currencies DOUBLE PRECISION,
sale_of_currency DOUBLE PRECISION,
FOREIGN KEY (currency_rateID) REFERENCES savings(currency_rateID)
);

CREATE TABLE credit(
creditID SERIAL PRIMARY KEY,
credit_informationID INT,
credit_historyID INT,
FOREIGN KEY (creditID) REFERENCES savings(creditID)
);

CREATE TABLE credit_information(
credit_informationID SERIAL PRIMARY KEY,
credit_opening_date DATE,
percent_rate DOUBLE PRECISION,
credit_closing_date DATE,
amount_of_contributions DOUBLE PRECISION,
FOREIGN KEY (credit_informationID) REFERENCES credit(creditID)
);

CREATE TABLE credit_history(
credit_historyID SERIAL PRIMARY KEY,
credit_number INT,
credit_closing_date DATE,
FOREIGN KEY (credit_historyID) REFERENCES credit(creditID)
);

CREATE TABLE portfolio(
portfolioID SERIAL PRIMARY KEY,
actionsID INT,
FOREIGN KEY (portfolioID) REFERENCES savings(portfolioID)
);

CREATE TABLE actions(
actionsID SERIAL PRIMARY KEY,
amount_of_actions INT,
FOREIGN KEY (actionsID) REFERENCES portfolio(portfolioID)
);

CREATE TABLE history_of_operations(
history_of_operationsID SERIAL PRIMARY KEY,
transferID INT UNIQUE,
receivingID INT UNIQUE,
expensesID INT UNIQUE, 
FOREIGN KEY (history_of_operationsID) REFERENCES account(history_of_operationsID)
);

CREATE TABLE expenses(
expensesID SERIAL PRIMARY KEY,
monthly_expenses INT,
FOREIGN KEY (expensesID) REFERENCES history_of_operations(expensesID )
);

 CREATE TABLE receiving(
receivingID SERIAL PRIMARY KEY,
userID INT,
cardID INT,
amount_received DOUBLE PRECISION,
FOREIGN KEY (receivingID) REFERENCES history_of_operations(receivingID),
FOREIGN KEY (cardID) REFERENCES from_card_to_card(cardID),
FOREIGN KEY (userID) REFERENCES transfers_to_users(userID)
);

CREATE TABLE transfer(
transferID SERIAL PRIMARY KEY,
transfers_to_usersID INT,
from_card_to_cardID INT,
transfer_amount DOUBLE PRECISION,
FOREIGN KEY (transferID) REFERENCES history_of_operations(history_of_operationsID),
FOREIGN KEY (transfers_to_usersID) REFERENCES transfers_to_users(userID),
FOREIGN KEY (from_card_to_cardID) REFERENCES from_card_to_card(cardID)
);