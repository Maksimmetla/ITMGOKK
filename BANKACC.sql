CREATE TABLE transfer(
transferID SERIAL PRIMARY KEY,
transfers_to_usersID INT,
from_card_to_cardID INT,
transfer_amount DOUBLE PRECISION,
FOREIGN KEY (transferID) REFERENCES history_of_operations(transferID),
FOREIGN KEY (transfers_to_usersID) REFERENCES transfers_to_users(userID),
FOREIGN KEY (from_card_to_cardID) REFERENCES from_card_to_card(cardID)
);