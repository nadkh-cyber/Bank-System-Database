CREATE TABLE Customers(
    customer_id INT PRIMARY KEY
    AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    national_id VARCHAR(10) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    account_number VARCHAR(20)UNIQUE NOT NULL,
    account_type ENUM('Checking','Savings') DEFAULT 'checking',
    balance DECIMAL(15,2) DEFAULT 0.00,
    status ENUM('Active','Frozen','Closed') DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) oN DELETE CASCADE

) ;

CREATE TABLE Transaction (
    Transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,transaction_type ENUM ('DEPOSIT','Withdrawal','Transfer') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    desciption VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)oN DELETE CASCADE

);